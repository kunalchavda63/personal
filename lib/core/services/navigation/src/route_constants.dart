enum RoutesEnum {
  onboard('/onboard'),
  login('/login'),
  register('/register'),
  artists('/artists'),
  podcasts('/podcasts'),
  otp('/otp'),
  screen('/screen'),
  homeScreen('/homeScreen'),
  panelDemo('/panelDemo'),
  androidScreen('/androidScreen'),
  windowScreen('/windowsScreen');

  const RoutesEnum(this.path);

  final String path;
}
