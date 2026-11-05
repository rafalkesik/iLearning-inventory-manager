module PagesHelper
  def nav_tab(name, active: false)
    label = name.parameterize(separator: '_')
    tag.li(class: 'nav-item', role: 'presentation') do
      tag.button(
        name,
        class: class_names('nav-link', active: active),
        id:    "#{label}-tab",
        type: 'button',
        role: 'tab',
        data: { bs_toggle: 'tab', bs_target: "##{label}-tab-pane"},
        aria: { controls: "#{label}-tab-pane}", selected: active }
      )
    end
  end

  def nav_tab_content(name, active: false)
    label   = name.parameterize(separator: '_')
    content = render "inventories/#{label}" rescue nil

    tag.div(
      content,
      class: class_names('tab-pane', active: active, show: active),
      id:    "#{label}-tab-pane",
      role:  'tabpanel',
      aria:  { labelledby: "#{label}-tab" },
      tabindex: '0'
    )
  end
end
