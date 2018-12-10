class ProjectResource < ApplicationResource
  attribute :name, :string

  # Reference child classes
  self.polymorphic = %w(DubbingProjectResource VoiceoverProjectResource)

  has_many :renderables
end
