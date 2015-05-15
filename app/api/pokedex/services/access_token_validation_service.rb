module AccessTokenValidationService
    #States
    VALID              = :valid
    EXPIRED            = :expired
    REVOKED            = :revoked
    INSUFFICIENT_SCOPE = :insufficient_scope

    ##
    #grabs a string represeting a token and validates it using Doorkeeper gem.
    #@str_token The string representing a token.
    #@scopes An array with the scopes that you want for the token.
    def self.validate(token, scopes: [])
        state = VALID
        if token.expired?
            state = EXPIRED
        elsif token.revoked?
            state = REVOKED
        elsif !self.sufficient_scope?(token, scopes: scopes)
            state = INSUFFICIENT_SCOPE
        end
        return state
    end

    protected 
    
    #@str_token The string representing a token.
    #@scopes An array with the scopes that you want for the token.
    def self.sufficient_scope?(token, scopes: [])
        sufficient_scope = true 
        unless scopes.blank?
            required_scopes   = Set.new(scopes)
            authorized_scopes = Set.new(token.scopes)
            sufficient_scope  = authorized_scopes >= required_scopes
        end
        return sufficient_scope
    end
end