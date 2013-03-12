ThinkingSphinx::Index.define :place, :with => :active_record do
  indexes name, address, phones
  has state_cd
end