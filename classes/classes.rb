Class User
    def initialize(username, password, public_key)
        @username = username
        # should be a hash at this point, not plaintext
        @password = password 
        @messages = []
        @public_key = public_key
    end

    public
    def show_public_key
        {username: @username, public_key: @public_key}
    end

    def show_messages
        {username: @username, messages: @messages}
    end