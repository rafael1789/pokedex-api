class AlphaNumeric < Grape::Validations::Base
  def validate_param!(attr_name, params)
    unless params[attr_name] =~ /^[[:alnum:]]+$/
      raise Grape::Exceptions::Validation, params: [@scope.full_name(attr_name)], message: "must consist of alpha-numeric characters"
    end
  end
end