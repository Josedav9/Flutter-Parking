//Individual values
final REQUEST_URL = 'https://vecinoo.herokuapp.com/v1/api/';
final SIGN_IN = '/auth/signin';
final SIGN_UP = '/auth/signup';
final VEHICLES = '/vehicle';
final USERS = '/user';
final PARKINGSPACES = '/parkingspace';
final PLATE = '/plate';
final POSITIONS = '/positions';
final BESTPOINTS = '/bestpoints';

//Complete request url

final REQUEST_LOGIN = REQUEST_URL + SIGN_IN;
final REQUEST_REGISTER = REQUEST_URL + SIGN_UP;
final REQUEST_VEHICLES = REQUEST_URL + VEHICLES;
final REQUEST_USERS = REQUEST_URL + USERS;
final REQUEST_PARKINGSPACES = REQUEST_URL + PARKINGSPACES;
final REQUEST_VEHICLE_BY_PLATE = REQUEST_URL + VEHICLES + PLATE;
final REQUEST_POSITION_UPDATE = REQUEST_URL + PARKINGSPACES + POSITIONS;
final REQUEST_BESTPOINTS_USERS = REQUEST_URL + USERS + BESTPOINTS;