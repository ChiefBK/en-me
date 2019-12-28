RSpec::Matchers.define :contain_number_of_data_records do |expected_number_of_records|
  match do |response_body|
    response_body['data'].length == expected_number_of_records
  end

  failure_message do |response_body|
    "expected response body to have #{expected_number_of_records} number of records but had #{response_body['data'].length} records"
  end
end

RSpec::Matchers.define :have_record_with_attribute_and_value do |index, attribute, value|
  match do |response_body|
    response_body['data'][index]['attributes'][attribute] == value
  end

  failure_message do |_response_body|
    "expected response body to have record at index '#{index}' to have attribute '#{attribute}' with value '#{value}'"
  end
end