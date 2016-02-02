require 'spec_helper'

describe 'PageForce::Accessors' do

  context 'SFDC Object Record Page' do

    before(:all) do
      @browser = Watir::Browser.new :chrome
      visit(LoginPage).login_to_salesforce
      on(HomePage).visit_an_account
    end

    class LoginPage
      include PageObject
      include PageObject::PageFactory

      page_url 'test.salesforce.com'

      text_field(:username, id: "username")
      text_field(:password, id: "password")
      button(:login, id: "Login")
      li(:home, id: 'home_Tab')


      def login_to_salesforce
        self.username = CONNECTED_APP_DATA[:credentials][:admin][:username]
        self.password = CONNECTED_APP_DATA[:credentials][:admin][:password]
        self.login
        self.browser.wait_until { self.home? }
      end
    end

    class HomePage
      include PageObject

      def visit_an_account
        account_id = RESTFORCE_API.query('select id from Account').first.Id
        self.browser.goto "#{self.browser.url.match(/(.*)salesforce.com/).to_s}/#{account_id}"
      end

    end

    class AccountPage
      include PageForce

      self.sfdc_object_name = 'Account'

      sfdc_text_field(:phone, sfdc_field_name: 'Phone')
      sfdc_lookup(:account_owner, sfdc_field_name: 'Owner')
      sfdc_link(:website, sfdc_field_name: 'Website')
      sfdc_lookup(:parent_account, sfdc_field_name: 'Parent')
      sfdc_text_area(:mail_street, sfdc_field_name: 'MailingStreet')
    end

    context 'View' do
      context '.sfdc_text_field' do

        subject { on(AccountPage).phone }

        it { is_expected.to_not be_nil }

      end

      context '.sfdc_cell' do

        subject { on(AccountPage).account_owner_element.text }

        it { is_expected.to_not be_nil }

      end

      context '.sfdc_link' do

        subject { on(AccountPage).website_element.text }

        it { is_expected.to_not be_nil }

      end

      context '.sfdc_lookup' do

        subject { on(AccountPage).parent_account }

        it { is_expected.to_not be_nil }

      end

      context '.visualforce_page' do

        subject { on(AccountPage) }

        it { is_expected.to_not be_nil }

      end

      context '.sfdc_related_list' do

        subject { on(AccountPage) }

        it { is_expected.to_not be_nil }

      end
    end

    context 'Edit' do

      context '.sfdc_text_field' do

        subject { on(AccountPage) }

        it { is_expected.to_not be_nil }

      end

      context '.sfdc_cell' do

        subject { on(AccountPage) }

        it { is_expected.to_not be_nil }

      end

      context '.sfdc_text_area' do

        subject { on(AccountPage) }

        it { is_expected.to_not be_nil }

      end

      context '.sfdc_checkbox' do

        subject { on(AccountPage) }

        it { is_expected.to_not be_nil }

      end

      context '.sfdc_select_list' do

        subject { on(AccountPage) }

        it { is_expected.to_not be_nil }

      end

      context '.sfdc_link' do

        subject { on(AccountPage) }

        it { is_expected.to_not be_nil }

      end

      context '.sfdc_lookup' do

        subject { on(AccountPage) }

        it { is_expected.to_not be_nil }

      end

      context '.visualforce_page' do

        subject { on(AccountPage) }

        it { is_expected.to_not be_nil }

      end

      context '.sfdc_related_list' do

        subject { on(AccountPage) }

        it { is_expected.to_not be_nil }

      end
    end


  end

end