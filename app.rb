require_relative 'config/environment'

class App < Sinatra::Base

	get '/reversename/:name' do
		params[:name].reverse
	end

	get '/square/:number' do
		@square = params[:number].to_i ** 2
		@square.to_s
	end

	get '/say/:number/:phrase' do
		string = ''
		params[:number].to_i.times { string += params[:phrase] }
		string
	end

	get '/say/:word1/:word2/:word3/:word4/:word5' do
		"#{params[:word1] + ' ' + params[:word2] + ' ' + params[:word3] + ' ' + params[:word4] + ' ' + params[:word5]}."
	end

	get '/:operation/:number1/:number2' do
		@operation = params[:operation]
		@num1 = params[:number1].to_i
		@num2 = params[:number2].to_i

		case Operate
		when @operation == "add"
			result = @num1 + @num2
		when @operation == "subtract"
			result = @num1 - @num2
		when @operation == "multiply"
			result = @num1 * @num2
		when @operation == "divide"
			result = @num1 / @num2
		end

		result.to_s
	end

end