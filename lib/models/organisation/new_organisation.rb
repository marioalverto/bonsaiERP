# encoding: utf-8
# author: Boris Barroso
# email: boriscyber@gmail.com
require 'active_support/concern'
module Models::Organisation::NewOrganisation

  extend ActiveSupport::Concern
  
  included do
    before_create :set_organisation, :unless => 'organisation_id.present?'
    attr_readonly :organisation_id
  end

  module InstanceMethods

    private
      def set_organisation
        self.organisation_id = OrganisationSession.organisation_id
      end
  end

  module ClassMethods
    def org
      where(:organisation_id => OrganisationSession.organisation_id)
    end
  end
end