class V1::MappingsController < ApplicationController
  def index
  	render json: {:mapings => [
  		{
  			:name => 'some-thing',
  			:guid => 'Test ========'
  		}
  	]}.to_json
  end
end
