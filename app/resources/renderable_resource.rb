class RenderableResource < ApplicationResource
  attribute :name, :string

  # Reference child classes
  self.polymorphic = %w(DubbingResource VoiceoverResource)

  belongs_to :project
end
