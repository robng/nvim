return {
  focus_explorer = function()
    local active = Snacks.picker.get({ source = "explorer" })[1]
    if active ~= nil then
      active:focus()
      return
    end

    Snacks.explorer.open()
  end,
}
