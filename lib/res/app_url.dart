class AppUrl {
  static const String baseUrl = 'http://172.16.1.241:8000';

  static const String countryApi='$baseUrl/api/v1/venue/getCountries';
  static const String stateApi='$baseUrl/api/v1/venue/getStates';
  static const String cityApi='$baseUrl/api/v1/venue/getCities';
  static const String otpGenerate = '$baseUrl/api/v1/login/generate-otp';
  static const String signupApi = '$baseUrl/api/v1/login/register';
  static const String loginApi = '$baseUrl/api/v1/login/sign-in';

  static const String otpVerifyApi='$baseUrl/api/v1/login/verifying-otp';

  //venue api
  static const String addVenueApi='$baseUrl/api/v1/venue/addVenue';
  static const String addVenueBusinessInfo='$baseUrl/api/v1/venue/addBusinessinfo';
  static const String addBankAccountApi='$baseUrl/api/v1/venue/addBankAccount';
  static const String fetchVenueApi='$baseUrl/api/v1/venue/getVenues';

  //Event api
  static const String eventDurationApi='$baseUrl/api/v1/event/getEventDuration';
  static const String eventFrequency='$baseUrl/api/v1/event/getEventfrequency';
  static const String eventTypeApi='$baseUrl/api/v1/event/getEventTypes';
  static const String eventInfoApi='$baseUrl/api/v1/event/event-info';

  //ticket api endpoint
  static const String ticketCtgryApi='$baseUrl/api/v1/ticket/getTicketCategories';
  static const String ticketListApi='$baseUrl/api/v1/ticket/getTickets';
  static const String addticketApi='$baseUrl/api/v1/ticket/addTicket';
  static const String ticketInfoApi='$baseUrl/api/v1/ticket/ticket-info';

  //profile api endpoint
  static const String getUserInfoApi='$baseUrl/api/v1/login/get-profile-info';

  static const String userListApi =
      'https://webhook.site/3c05a17b-3c4e-4f07-96f6-c613b4df4d74';
  static const String homedashboardApi='$baseUrl/api/v1/login/get-dashboard-info';

  static const String employeetypeAPI='$baseUrl/api/v1/employee/employee-types';
}