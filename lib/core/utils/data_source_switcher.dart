enum DataSourceMode { api, fixture }

class DataSourceSwitcher {
  static DataSourceMode mode = DataSourceMode.api;

  static bool get isFixtureMode => mode == DataSourceMode.fixture;

  static void toggleMode(DataSourceMode newMode) {
    mode = newMode;
  }
}
