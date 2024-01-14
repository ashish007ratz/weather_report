

final Map<String, List<String>> indiaStateCities = {
  'andhra pradesh': [
    'vijayawada', 'visakhapatnam', 'guntur', 'tirupati', 'nellore', 'kadapa', 'kurnool', 'anantapur'
  ],
  'arunachal pradesh': [
    'itanagar', 'naharlagun', 'pasighat', 'roing', 'tezu', 'along', 'bomdila', 'daporijo'
  ],
  'assam': [
    'guwahati', 'dibrugarh', 'silchar', 'jorhat', 'tezpur', 'nagaon', 'sivasagar', 'diphu'
  ],
  'bihar': [
    'patna', 'gaya', 'muzaffarpur', 'bhagalpur', 'darbhanga', 'begusarai', 'arrah', 'sasaram'
  ],
  'chhattisgarh': [
    'raipur', 'bhilai', 'bilaspur', 'durg', 'korba', 'raigarh', 'jagdalpur', 'raipur'
  ],
  'goa': [
    'panaji', 'margao', 'vasco da gama', 'mapusa', 'ponda', 'bicholim', 'curchorem', 'sanguem'
  ],
  'gujarat': [
    'ahmedabad', 'surat', 'vadodara', 'rajkot', 'bhavnagar', 'jamnagar', 'junagadh', 'gandhinagar'
  ],
  'haryana': [
    'chandigarh', 'faridabad', 'gurgaon', 'rohtak', 'hisar', 'panipat', 'karnal', 'ambala'
  ],
  'himachal pradesh': [
    'shimla', 'mandi', 'dharamshala', 'kullu', 'solan', 'nahan', 'bilaspur', 'hamirpur'
  ],
  'jharkhand': [
    'ranchi', 'jamshedpur', 'dhanbad', 'bokaro', 'deoghar', 'phusro', 'ramgarh', 'hazaribagh'
  ],
  'karnataka': [
    'bangalore', 'mysore', 'hubli', 'mangalore', 'belgaum', 'gulbarga', 'davanagere', 'bijapur'
  ],
  'kerala': [
    'thiruvananthapuram', 'kochi', 'kozhikode', 'thrissur', 'kollam', 'kottayam', 'palakkad', 'alappuzha'
  ],
  'madhya pradesh': [
    'bhopal', 'indore', 'jabalpur', 'gwalior', 'ujjain', 'sagar', 'dewas', 'satna'
  ],
  'maharashtra': [
    'mumbai', 'pune', 'nagpur', 'nashik', 'thane', 'pimpri-chinchwad', 'aurangabad', 'solapur'
  ],
  'manipur': [
    'imphal', 'thoubal', 'bishnupur', 'churachandpur', 'kakching', 'ukhrul', 'lilong', 'mayang imphal'
  ],
  'meghalaya': [
    'shillong', 'tura', 'jowai', 'nongpoh', 'baghmara', 'williamnagar', 'mairang', 'resubelpara'
  ],
  'mizoram': [
    'aizawl', 'lunglei', 'champhai', 'serchhip', 'kolasib', 'saiha', 'lengpui', 'bilkhawthlir'
  ],
  'nagaland': [
    'kohima', 'dimapur', 'mokokchung', 'tuensang', 'zunheboto', 'wokha', 'phek', 'mon'
  ],
  'odisha': [
    'bhubaneswar', 'cuttack', 'rourkela', 'sambalpur', 'berhampur', 'puri', 'baleshwar', 'brahmapur'
  ],
  'punjab': [
    'chandigarh', 'ludhiana', 'amritsar', 'jalandhar', 'patiala', 'bathinda', 'hoshiarpur', 'mohali'
  ],
  'rajasthan': [
    'jaipur', 'jodhpur', 'udaipur', 'kota', 'bikaner', 'ajmer', 'bhilwara', 'alwar'
  ],
  'sikkim': [
    'gangtok', 'namchi', 'mangan', 'rangpo', 'gezing', 'singtam', 'naya bazar', 'ranipool'
  ],
  'tamil nadu': [
    'chennai', 'coimbatore', 'madurai', 'tiruchirappalli', 'salem', 'tirunelveli', 'erode', 'vellore'
  ],
  'telangana': [
    'hyderabad', 'warangal', 'nizamabad', 'karimnagar', 'ramagundam', 'khammam', 'mahbubnagar', 'nalgonda'
  ],
  'tripura': [
    'agartala', 'udaipur', 'dharmanagar', 'belonia', 'kailasahar', 'ambassa', 'khowai', 'kamalpur'
  ],
  'uttar pradesh': [
    'lucknow', 'kanpur', 'agra', 'meerut', 'allahabad', 'ghaziabad', 'varanasi', 'bareilly'
  ],
  'uttarakhand': [
    'dehradun', 'haridwar', 'rishikesh', 'haldwani', 'rudrapur', 'kashipur', 'ramnagar', 'roorkee', 'none city'
  ],
  'west bengal': [
    'kolkata', 'howrah', 'durgapur', 'asansol', 'siliguri', 'malda', 'kharagpur', 'jalpaiguri'
  ],
};

// getting cities of the selected state
List<String> getCities (String state){
  return indiaStateCities[state]!;
}
