# -*- encoding: utf-8 -*-
module Steam
  # A Ruby DSL for communicating with the Steam::User Web API.
  # @see https://partner.steamgames.com/doc/webapi/ISteamUserAuth
  # @since 1.0.0
  module UserAuth
    # Get AuthenticateUserTicket
    # @param [Fixnum] steamid 64 bit Steam ID to return Achievements list for.
    # @param [Fixnum] appid AppID to get achievements for
    # @param [String] ticket Convert the ticket from GetAuthSessionTicket from
    #   binary to hex into an appropriately sized byte character array and pass
    #   the result in as this ticket parameter.
    # @return [Hash] A hash containing the API response
    # @see http://wiki.teamfortress.com/wiki/WebAPI/GetPlayerAchievements
    def self.authenticate_user_ticket(appid, ticket)
      params = { appid: appid, ticket: ticket }
      response = client.get 'AuthenticateUserTicket/v1', params: params
      response
    end

    private

    def self.client
      build_client 'ISteamUserAuth'
    end
  end
end
