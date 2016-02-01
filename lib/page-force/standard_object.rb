module PageForce
  module StandardObject
    SFDCObjectField = Struct.new(:field_name, :id)

    class Account
      STANDARD_FIELDS = [SFDCObjectField.new('AccountName', 'acc2'),
                         SFDCObjectField.new('Parent', 'acc3'),
                         SFDCObjectField.new('AccountSite', 'acc23'),
                         SFDCObjectField.new('AccountNumber', 'acc5'),
                         SFDCObjectField.new('Type', 'acc6'),
                         SFDCObjectField.new('Industry', 'acc7'),
                         SFDCObjectField.new('AnnualRevenue', 'acc8'),
                         SFDCObjectField.new('Rating', 'acc9'),
                         SFDCObjectField.new('Phone', 'acc10'),
                         SFDCObjectField.new('Fax', 'acc11'),
                         SFDCObjectField.new('Website', 'acc12'),
                         SFDCObjectField.new('TickerSymbol', 'acc13'),
                         SFDCObjectField.new('Ownership', 'acc14'),
                         SFDCObjectField.new('Employees', 'acc15'),
                         SFDCObjectField.new('SIC Code', 'acc16'),
                         SFDCObjectField.new('BillingStreet', 'acc17street'),
                         SFDCObjectField.new('BillingCity', 'acc17city'),
                         SFDCObjectField.new('BillingStateProvince', 'acc17state'),
                         SFDCObjectField.new('BillingZipCode', 'acc17zip'),
                         SFDCObjectField.new('BillingCountry', 'acc17country'),
                         SFDCObjectField.new('ShippingStreet', 'acc18street'),
                         SFDCObjectField.new('ShippingCity', 'acc18city'),
                         SFDCObjectField.new('ShippingStateProvince', 'acc18state'),
                         SFDCObjectField.new('ShippingZipCode', 'acc18zip'),
                         SFDCObjectField.new('ShippingCountry', 'acc18country'),
                         SFDCObjectField.new('BillingAddress', 'acc17'),
                         SFDCObjectField.new('ShippingAddress', 'acc18'),
                         SFDCObjectField.new('Street', 'acc18street'),
                         SFDCObjectField.new('City', 'acc18city'),
                         SFDCObjectField.new('State/Province', 'acc18state'),
                         SFDCObjectField.new('Zip/Postal Code', 'acc18zip'),
                         SFDCObjectField.new('Country', 'acc18country')]


    end

    class Contact
      STANDARD_FIELDS =[SFDCObjectField.new('First Name', 'name_firstcon2'),
                        SFDCObjectField.new('Last Name', 'name_lastcon2'),
                        SFDCObjectField.new('Account', 'con4'),
                        SFDCObjectField.new('Title', 'con5'),
                        SFDCObjectField.new('Department', 'con6'),
                        SFDCObjectField.new('Reports To', 'con8'),
                        SFDCObjectField.new('Reports To', 'con8'),
                        SFDCObjectField.new('Phone', 'con10'),
                        SFDCObjectField.new('Home Phone', 'con13'),
                        SFDCObjectField.new('Mobile', 'con12'),
                        SFDCObjectField.new('Fax', 'con11'),
                        SFDCObjectField.new('Email', 'con15'),
                        SFDCObjectField.new('Email Opt Out', 'con23'),
                        SFDCObjectField.new('Mailing Street', 'con19street'),
                        SFDCObjectField.new('Mailing City', 'con19city'),
                        SFDCObjectField.new('Mailing State/Province', 'con19state'),
                        SFDCObjectField.new('Mailing Zip/Postal Code', 'con19zip'),
                        SFDCObjectField.new('Mailing Country', 'con19country'),
                        SFDCObjectField.new('Other Street', 'con18street'),
                        SFDCObjectField.new('Other City', 'con18city'),
                        SFDCObjectField.new('Other State/Province', 'con18state'),
                        SFDCObjectField.new('Other Zip/Postal Code', 'con18zip'),
                        SFDCObjectField.new('Other Country', 'con18country'),
                        SFDCObjectField.new('Description', 'con20'),
                        SFDCObjectField.new('BillingAddress', 'con17'),
                        SFDCObjectField.new('ShippingAddress', 'con18')]
    end

    class Opportunity
      STANDARD_FIELDS = [SFDCObjectField.new('Name', 'opp3'),
                         SFDCObjectField.new('Account', 'opp4'),
                         SFDCObjectField.new('Type', 'opp5'),
                         SFDCObjectField.new('LeadSource', 'opp6'),
                         SFDCObjectField.new('ForecastCategory', 'forecastcategory'),
                         SFDCObjectField.new('Amount', 'opp7'),
                         SFDCObjectField.new('CloseDate', 'opp9'),
                         SFDCObjectField.new('NextStep', 'opp10'),
                         SFDCObjectField.new('Stage', 'opp11'),
                         SFDCObjectField.new('Probability', 'opp12'),
                         SFDCObjectField.new('CampaignSource', 'opp17'),
                         SFDCObjectField.new('Description', 'opp14')]
    end

    class Case
      STANDARD_FIELDS = [SFDCObjectField.new('ContactID', 'cas3'),
                         SFDCObjectField.new('Contact', 'cas3'),
                         SFDCObjectField.new('Type', 'cas5'),
                         SFDCObjectField.new('CaseReason', 'cas6'),
                         SFDCObjectField.new('Status', 'cas7'),
                         SFDCObjectField.new('Priority', 'cas8'),
                         SFDCObjectField.new('CaseOrigin', 'cas11'),
                         SFDCObjectField.new('Subject', 'cas14'),
                         SFDCObjectField.new('InternalComments', 'cas15'),
                         SFDCObjectField.new('AssignmentRules', 'cas21'),
                         SFDCObjectField.new('SendNotification', 'cas22')]
    end

    class LeadConversion
      STANDARD_FIELDS = [SFDCObjectField.new('Do not create a new opportunity upon conversion', 'nooptt'),
                         SFDCObjectField.new('Send email to the Owner', 'sem'),
                         SFDCObjectField.new('ConvertedStatus', 'cstatus'),
                         SFDCObjectField.new('Priority', 'tsk13'),
                         SFDCObjectField.new('Status', 'tsk12'),
                         SFDCObjectField.new('Send Email Notification', 'email_followup')]
    end

    class Lead
      STANDARD_FIELDS = [SFDCObjectField.new('FirstName', 'name_firstlea2'),
                         SFDCObjectField.new('LastName', 'name_lastlea2'),
                         SFDCObjectField.new('Company', 'lea3'),
                         SFDCObjectField.new('Title', 'lea4'),
                         SFDCObjectField.new('LeadSource', 'lea5'),
                         SFDCObjectField.new('Industry', 'lea6'),
                         SFDCObjectField.new('AnnualRevenue', 'lea7'),
                         SFDCObjectField.new('CampaignID', 'lea20'),
                         SFDCObjectField.new('Description', 'lea17'),
                         SFDCObjectField.new('Phone', 'lea8'),
                         SFDCObjectField.new('Mobile', 'lea9'),
                         SFDCObjectField.new('Fax', 'lea10'),
                         SFDCObjectField.new('Email', 'lea11'),
                         SFDCObjectField.new('Website', 'lea12'),
                         SFDCObjectField.new('LeadStatus', 'lea13'),
                         SFDCObjectField.new('Rating', 'lea14'),
                         SFDCObjectField.new('Employees', 'lea15'),
                         SFDCObjectField.new('EmailOptOut', 'lea22'),
                         SFDCObjectField.new('Street', 'lea16street'),
                         SFDCObjectField.new('City', 'lea16city'),
                         SFDCObjectField.new('State/Province', 'lea16state'),
                         SFDCObjectField.new('Zip/Postal Code', 'lea16zip'),
                         SFDCObjectField.new('Country', 'lea16country'),
                         SFDCObjectField.new('UseAssignmentRule', 'lea21'),
                         SFDCObjectField.new('Address', 'lea16')]
    end

    class Task
      STANDARD_FIELDS = [SFDCObjectField.new('AssignedTo', 'tsk1'),
                         SFDCObjectField.new('Subject', 'tsk5'),
                         SFDCObjectField.new('DueDate', 'tsk4'),
                         SFDCObjectField.new('Status', 'tsk4'),
                         SFDCObjectField.new('Who', 'tsk2'),
                         SFDCObjectField.new('What', 'tsk3'),
                         SFDCObjectField.new('Comments', 'tsk6')]
    end

    class Event
      STANDARD_FIELDS = [SFDCObjectField.new('AssignedTo', 'evt1'),
                         SFDCObjectField.new('Subject', 'evt5'),
                         SFDCObjectField.new('Who', 'evt2'),
                         SFDCObjectField.new('What', 'evt3'),
                         SFDCObjectField.new('Location', 'evt12'),
                         SFDCObjectField.new('Date', 'evt4'),
                         SFDCObjectField.new('Time', 'evt13'),
                         SFDCObjectField.new('Type', 'evt10'),
                         SFDCObjectField.new('Description', 'evt6')]
    end

  end
end