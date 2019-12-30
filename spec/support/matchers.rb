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
    "expected record at index '#{index}' of response body to have attribute '#{attribute}' with value '#{value}'"
  end
end

RSpec::Matchers.define :have_number_of_relationships_with_type do |relationship_type, num_of_relationships|
  match do |data_record|
    data_record['relationships'][relationship_type]['data'].length == num_of_relationships
  end

  failure_message do |_data_record|
    "data record specified does not have #{num_of_relationships} associations with type '#{relationship_type}'"
  end
end