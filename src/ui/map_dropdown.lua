-- Plugin-local performance adapter for PrettyUI's ordered, searchable ComboBox.
-- Batch visibility changes: List:SetEntryVisible currently rebuilds every row per call.
-- Keep the dependency untouched and fall back to its implementation if its shape changes.
local M={}
function M.Optimize(combo)
    if not combo or type(combo._Filter)~="function" or type(combo._LayoutDropdown)~="function" or not combo.dropdown
        or type(combo.dropdown._RebuildRows)~="function"
        or not combo.dropdown.entriesByID then return combo end
    local originalFilter=combo._Filter
    local originalLayout=combo._LayoutDropdown
    function combo:_LayoutDropdown()
        local x,y=self.root.x or 0,self.root.y or 0
        if self.context and self.context.active then x,y=self.context.position(self.root)end
        local count=0;for _,entry in ipairs(self.entries)do if entry.visible then count=count+1 end end
        local geometry=table.concat({x,y,self.root.width or 0,self.root.height or 0,
            self.overlayParent and self.overlayParent.height or 0,count,self.maxVisibleEntries,self.entryHeight},":")
        if self._mapDropdownGeometry==geometry then return end
        self._mapDropdownGeometry=geometry
        return originalLayout(self)
    end
    function combo:_Filter(value)
        local query=string.lower(tostring(value or ""))
        local list=self.dropdown
        -- Check before any mutation so incompatible dependency versions use their own path.
        for _,entry in ipairs(self.entries)do
            if not list.entriesByID[entry.id]then return originalFilter(self,value)end
        end
        local changed=false
        for _,entry in ipairs(self.entries)do
            entry._mapSearchLabel=entry._mapSearchLabel or string.lower(entry.label)
            local visible=query=="" or string.find(entry._mapSearchLabel,query,1,true)~=nil
            local rowEntry=list.entriesByID[entry.id]
            if rowEntry.visible~=visible then changed=true end
            entry.visible=visible;rowEntry.visible=visible
            if not visible then rowEntry.selected=false end
        end
        if changed then
            list:_RebuildRows()
            if list.SetScrollPosition then list:SetScrollPosition(0) end
        end
        local selected=self.selectedID and self.entriesByID[self.selectedID]
        if selected and selected.visible then list:SetSelected(selected.id,true,false)end
        -- Search results start at the top; ordinary overlay layout updates retain scrolling.
        if changed then self._mapDropdownGeometry=nil end
        self:_LayoutDropdown()
    end
    return combo
end
return M
