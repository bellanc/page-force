require 'spec_helper'

describe PageForce::Accessors do

  context 'SFDC Object Record Page' do

    before(:all) do
      visit(LoginPage).login_to_salesforce
      on(HomePage).visit_an_account
    end

    class AccountPage
      include PageForce

      sfdc_text_field(:phone, sdfc_field_name: 'Phone')
      sfdc_cell(:account_owner, sfdc_field_name: 'Account_Owner')
      sfdc_text_area(:billing_street, sfdc_field_name: 'Billing Street')
      sfdc_checkbox()
      sfdc_select_list(:ownership, sfdc_field_name: 'Ownership')
      sfdc_link(:website, sfdc_field_name: 'Website')
      sfdc_lookup(:parent_account, sfdc_field_name: 'Parent Account')
      sfdc_related_list

    end

    context 'View' do
      context '.sfdc_text_field' do

      end

      context '.sfdc_cell' do

      end

      context '.sfdc_text_area' do

      end

      context '.sfdc_checkbox' do

      end

      context '.sfdc_select_list' do

      end

      context '.sfdc_link' do

      end

      context '.sfdc_lookup' do

      end

      context '.visualforce_page' do

      end

      context '.sfdc_related_list' do

      end
    end

    context 'Edit' do

      context '.sfdc_text_field' do

      end

      context '.sfdc_cell' do

      end

      context '.sfdc_text_area' do

      end

      context '.sfdc_checkbox' do

      end

      context '.sfdc_select_list' do

      end

      context '.sfdc_link' do

      end

      context '.sfdc_lookup' do

      end

      context '.visualforce_page' do

      end

      context '.sfdc_related_list' do

      end
    end


  end

end