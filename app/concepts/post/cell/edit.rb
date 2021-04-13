module Post::Cell
  class Edit < Trailblazer::Cell
    include ActiveSupport::Concern
    include ActionView::Context
    include ActionView::RecordIdentifier
    include ActionView::Helpers::FormHelper
    include ActionView::Helpers::TextHelper
    include ActionView::Helpers::FormOptionsHelper
    include SimpleForm::ActionViewExtensions::FormHelper
    include Formular::Helper
  end
end
