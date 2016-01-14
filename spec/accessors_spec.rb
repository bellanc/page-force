require 'spec_helper'

class WatirAccessorsTestPageObject
  include PageObject

  sf_field(:record_id, :sflabel => 'Record Id')
  sf_text_field(:social_security_number, :sflabel => 'SSN')
  sf_button(:generate, :sflabel => 'Generate Lead')
  sf_select_list(:state, :sflabel => 'State')
  sf_link(:account, :sflabel => 'Account')
  # sf_related_list(:click_me, :sflabel => 'button_submit')
  # visualforce_page(:active, :id => 'is_active_id')

end


describe PageObject::Accessors do

  context "when using Watir" do
    let(:watir_browser) { mock_watir_browser }
    let(:watir_page_object) { WatirAccessorsTestPageObject.new(watir_browser) }

    context "#sf_field" do
      it "should generate accessor methods" do
        expect(watir_page_object).to respond_to(:record_id)
        expect(watir_page_object).to respond_to(:record_id_element)
      end

      it "should retrieve the text for the field" do
        expect(watir_browser).to receive(:td).and_return(watir_browser)
        expect(watir_browser).to receive(:text).and_return('1234')
        expect(watir_page_object.record_id).to eql '1234'
      end

      it "should retrieve the cell element from the page" do
        expect(watir_browser).to receive(:td).and_return(watir_browser)
        element = watir_page_object.record_id_element
        expect(element).to be_instance_of PageObject::Elements::TableCell
      end
    end


    context "#sf_text_field" do
      context 'Salesforce object page is being edited' do

        it "should generate accessor methods" do
          expect(watir_page_object).to respond_to(:social_security_number)
          expect(watir_page_object).to respond_to(:social_security_number)
          expect(watir_page_object).to respond_to(:social_security_number_element)
          expect(watir_page_object).to respond_to(:social_security_number?)
        end

        it "should get the text from the text field element" do
          allow(watir_page_object).to receive(:element_exists_for_identifier?).with({:xpath => "//*[text() ='SSN']//following::td[1]//input[@type='text']"}).and_return true
          expect(watir_browser).to receive(:text_field).and_return(watir_browser)
          expect(watir_browser).to receive(:value).and_return('Fake Company')
          expect(watir_page_object.social_security_number).to eql 'Fake Company'
        end

        it "should set some text on a text field element" do
          allow(watir_page_object).to receive(:element_exists_for_identifier?).with({:xpath => "//*[text() ='SSN']//following::td[1]//input[@type='text']"}).and_return true
          expect(watir_browser).to receive(:text_field).and_return(watir_browser)
          expect(watir_browser).to receive(:set).with('Other Company LLC')
          watir_page_object.social_security_number = 'Other Company LLC'
        end

        it "should retrieve a text field element" do
          allow(watir_page_object).to receive(:element_exists_for_identifier?).with({:xpath => "//*[text() ='SSN']//following::td[1]//input[@type='text']"}).and_return true
          expect(watir_browser).to receive(:text_field).and_return(watir_browser)
          element = watir_page_object.social_security_number_element
          expect(element).to be_instance_of PageObject::Elements::TextField
        end
      end

      context 'Salesforce object page is being viewed' do

        it "should generate accessor methods" do
          allow(watir_page_object).to receive(:element_exists_for_identifier?).with({:xpath => "//*[text() ='SSN']//following::td[1]"}).and_return true
          allow(watir_page_object).to receive(:element_exists_for_identifier?).with({:xpath => "//*[text() ='SSN']//following::td[1]//input[@type='text']"}).and_return false
          expect(watir_page_object).to respond_to(:social_security_number)
          expect(watir_page_object).to respond_to(:social_security_number_element)
        end

      end
    end

    context "#sf_button" do
      it "should generate accessor methods" do
        expect(watir_page_object).to respond_to :generate
        expect(watir_page_object).to respond_to :generate_element
      end

      it "should be able to click a button" do
        expect(watir_browser).to receive(:button).and_return(watir_browser)
        expect(watir_browser).to receive(:click)
        watir_page_object.generate
      end

      it "should retrieve a button element" do
        expect(watir_browser).to receive(:button).and_return(watir_browser)
        element = watir_page_object.generate_element
        expect(element).to be_instance_of PageObject::Elements::Button
      end
    end

    context "#sf_select_list" do
      context 'Salesforce object page is being viewed' do
        it "should generate accessor methods" do
          expect(watir_page_object).to respond_to(:state)
          expect(watir_page_object).to respond_to(:state_element)
        end

        it "should retrieve the text for the field" do
          allow(watir_page_object).to receive(:element_exists_for_identifier?).with({:xpath => "//*[text() ='State']//following::td[1]//select"}).and_return false
          allow(watir_page_object).to receive(:element_exists_for_identifier?).with({:xpath => "//*[text() ='State']//following::td[1]"}).and_return true

          expect(watir_browser).to receive(:td).and_return(watir_browser)
          expect(watir_browser).to receive(:text).and_return('OH')
          expect(watir_page_object.state).to eql 'OH'
        end

        it "should retrieve the cell element from the page" do
          allow(watir_page_object).to receive(:element_exists_for_identifier?).with({:xpath => "//*[text() ='State']//following::td[1]//select"}).and_return false
          allow(watir_page_object).to receive(:element_exists_for_identifier?).with({:xpath => "//*[text() ='State']//following::td[1]"}).and_return true

          expect(watir_browser).to receive(:td).and_return(watir_browser)
          element = watir_page_object.state_element
          expect(element).to be_instance_of PageObject::Elements::TableCell
        end
      end

      context 'Salesforce object page is being edited' do
        it "should generate accessor methods" do
          expect(watir_page_object).to respond_to :state
          expect(watir_page_object).to respond_to :state=
          expect(watir_page_object).to respond_to(:state_element)
        end

        it "should get the current item from a select list" do
          allow(watir_page_object).to receive(:element_exists_for_identifier?).with({:xpath => "//*[text() ='State']//following::td[1]//select"}).and_return true
          allow(watir_page_object).to receive(:element_exists_for_identifier?).with({:xpath => "//*[text() ='State']//following::td[1]"}).and_return false
          selected = "OH"
          expect(selected).to receive(:selected?).and_return(selected)
          expect(selected).to receive(:text).and_return("OH")
          expect(watir_browser).to receive(:select_list).and_return watir_browser
          expect(watir_browser).to receive(:options).and_return([selected])
          expect(watir_page_object.state).to eql "OH"
        end

        it "should set the current item of a select list" do
          expect(watir_browser).to receive(:select_list).and_return watir_browser
          expect(watir_browser).to receive(:select).with("OH")
          watir_page_object.state = "OH"
        end

        it "should retreive the select list element" do
          allow(watir_page_object).to receive(:element_exists_for_identifier?).with({:xpath => "//*[text() ='State']//following::td[1]//select"}).and_return true
          allow(watir_page_object).to receive(:element_exists_for_identifier?).with({:xpath => "//*[text() ='State']//following::td[1]"}).and_return false
          expect(watir_browser).to receive(:select_list).and_return(watir_browser)
          element = watir_page_object.state_element
          expect(element).to be_instance_of PageObject::Elements::SelectList
        end

        it "should return list of selection options" do
          option1 = double('option')
          option2 = double('option')
          expect(option1).to receive(:text).and_return("CA")
          expect(option2).to receive(:text).and_return("OH")

          select_element = double("select")
          expect(select_element).to receive(:options).twice.and_return([option1, option2])
          expect(watir_page_object).to receive(:state_element).and_return(select_element)

          expect(watir_page_object.state_options).to eql ["CA", "OH"]
        end
      end
    end

    context "#visualforce_page" do

    end

    context "#sf_link" do
      context 'Salesforce object page is being edited' do

        it "should generate accessor methods" do
          expect(watir_page_object).to respond_to(:account)
          expect(watir_page_object).to respond_to(:account=)
          expect(watir_page_object).to respond_to(:account_element)
          expect(watir_page_object).to respond_to(:account?)
        end

        it "should get the text from the text field element" do
          allow(watir_page_object).to receive(:element_exists_for_identifier?).with({:xpath => "//*[text() ='Account']//following::td[1]//input[@type='text']"}).and_return true
          expect(watir_browser).to receive(:text_field).and_return(watir_browser)
          expect(watir_browser).to receive(:value).and_return('Fake Company')
          expect(watir_page_object.account).to eql 'Fake Company'
        end

        it "should set some text on a text field element" do
          allow(watir_page_object).to receive(:element_exists_for_identifier?).with({:xpath => "//*[text() ='Account']//following::td[1]//input[@type='text']"}).and_return true
          expect(watir_browser).to receive(:text_field).and_return(watir_browser)
          expect(watir_browser).to receive(:set).with('Other Company LLC')
          watir_page_object.account = 'Other Company LLC'
        end

        it "should retrieve a text field element" do
          allow(watir_page_object).to receive(:element_exists_for_identifier?).with({:xpath => "//*[text() ='Account']//following::td[1]//input[@type='text']"}).and_return true
          expect(watir_browser).to receive(:text_field).and_return(watir_browser)
          element = watir_page_object.account_element
          expect(element).to be_instance_of PageObject::Elements::TextField
        end
      end

      context 'Salesforce object page is being viewed' do

        it "should generate accessor methods" do
          allow(watir_page_object).to receive(:element_exists_for_identifier?).with({:xpath => "//*[text() ='Account']//following::td[1]//input[@type='text']"}).and_return false
          allow(watir_page_object).to receive(:element_exists_for_identifier?).with({:xpath => "//*[text() ='Account']//following::td[1]//a"}).and_return true
          expect(watir_page_object).to respond_to(:account)
          expect(watir_page_object).to respond_to(:account_element)
        end

        it "should select a link" do
          allow(watir_page_object).to receive(:element_exists_for_identifier?).with({:xpath => "//*[text() ='Account']//following::td[1]//input[@type='text']"}).and_return false
          allow(watir_page_object).to receive(:element_exists_for_identifier?).with({:xpath => "//*[text() ='Account']//following::td[1]//a"}).and_return true
          expect(watir_browser).to receive_messages(link: watir_browser, click: watir_browser)
          watir_page_object.account
        end

        it "should return a link element" do
          allow(watir_page_object).to receive(:element_exists_for_identifier?).with({:xpath => "//*[text() ='Account']//following::td[1]//input[@type='text']"}).and_return false
          allow(watir_page_object).to receive(:element_exists_for_identifier?).with({:xpath => "//*[text() ='Account']//following::td[1]//a"}).and_return true
          expect(watir_browser).to receive(:link).and_return(watir_browser)
          element = watir_page_object.account_element
          expect(element).to be_instance_of PageObject::Elements::Link
        end
      end
    end

    context "#sf_related_list" do

    end

  end
end