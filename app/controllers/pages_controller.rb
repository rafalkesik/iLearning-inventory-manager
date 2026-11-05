class PagesController < ApplicationController
  def home
    @tabs = ['Items', 'Chat ∅', 'Settings ∅', 'Custom ID ∅', 'Fields ∅', 'Access ∅', 'Stats ∅', 'Export ∅']
  end
end
