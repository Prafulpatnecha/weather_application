class ApiModal {
  late Location location;
  late Current current;
  late Forecast forecast;

  ApiModal({required this.location,required this.current,required this.forecast});
  factory ApiModal.fromJson(Map m1)
  {
    return ApiModal(location: Location.fromJson(m1['location']), current: Current.fromJson(m1['current']), forecast: Forecast.fromJson(m1['forecast']));
  }
}

// Api Modal
class Location {
  late String name, region, country, tzId, localtime;
  late int localtimeEpoch;
  late dynamic lat, lon;

  Location(
      {required this.name,
      required this.region,
      required this.country,
      required this.lat,
      required this.lon,
      required this.tzId,
      required this.localtime,
      required this.localtimeEpoch});

  factory Location.fromJson(Map m1) {
    return Location(
        name: m1['name'],
        region: m1['region'],
        country: m1['country'],
        lat: m1['lat'],
        lon: m1['lon'],
        tzId: m1['tz_id'],
        localtime: m1['localtime'],
        localtimeEpoch: m1['localtime_epoch']);
  }
}

//ApiModal
class Current {
  late dynamic lastUpdatedEpoch,
      lastUpdated,
      tempC,
      tempF,
      isDay,
      windMph,
      windKph,
      windDegree,
      windDir,
      pressureMb,
      pressureIn,
      precipMm,
      precipIn,
      humidity,
      cloud,
      feelslikeC,
      feelslikeF,
      windchillC,
      windchillF,
      heatindexC,
      heatindexF,
      dewpointC,
      dewpointF,
      visKm,
      visMiles,
      uv,
      gustMph,
      gustKph;
  late Condition condition;

  Current(
      {required this.lastUpdatedEpoch,
      required this.lastUpdated,
      required this.tempC,
      required this.tempF,
      required this.isDay,
      required this.windMph,
      required this.windKph,
      required this.windDegree,
      required this.windDir,
      required this.pressureMb,
      required this.pressureIn,
      required this.precipMm,
      required this.precipIn,
      required this.humidity,
      required this.cloud,
      required this.feelslikeC,
      required this.feelslikeF,
      required this.windchillC,
      required this.windchillF,
      required this.heatindexC,
      required this.heatindexF,
      required this.dewpointC,
      required this.dewpointF,
      required this.visKm,
      required this.visMiles,
      required this.uv,
      required this.gustMph,
      required this.gustKph,
      required this.condition});

  factory Current.fromJson(Map m1) {
    return Current(
        lastUpdatedEpoch: m1['last_updated_epoch'],
        lastUpdated: m1['last_updated'],
        tempC: m1['temp_c'],
        tempF: m1['temp_f'],
        isDay: m1['is_day'],
        windMph: m1['wind_mph'],
        windKph: m1['wind_kph'],
        windDegree: m1['wind_degree'],
        windDir: m1['wind_dir'],
        pressureMb: m1['pressure_mb'],
        pressureIn: m1['pressure_in'],
        precipMm: m1['precip_mm'],
        precipIn: m1['precip_in'],
        humidity: m1['humidity'],
        cloud: m1['cloud'],
        feelslikeC: m1['feelslike_c'],
        feelslikeF: m1['feelslike_f'],
        windchillC: m1['windchill_c'],
        windchillF: m1['windchill_f'],
        heatindexC: m1['heatindex_c'],
        heatindexF: m1['heatindex_f'],
        dewpointC: m1['dewpoint_c'],
        dewpointF: m1['dewpoint_f'],
        visKm: m1['vis_km'],
        visMiles: m1['vis_miles'],
        uv: m1['uv'],
        gustMph: m1['gust_mph'],
        gustKph: m1['gust_kph'],
        condition: Condition.fromJson(m1['condition']));
  }
}

// Current
class Condition {
  late String text, icon;
  late dynamic code;

  Condition({required this.text, required this.icon, required this.code});

  factory Condition.fromJson(Map m1) {
    return Condition(text: m1['text'], icon: m1['icon'], code: m1['code']);
  }
}

// ApiModal
class Forecast {
  late List<Forecastday> forecastday;

  Forecast({required this.forecastday});
  factory Forecast.fromJson(Map m1)
  {
    return Forecast(forecastday: (m1['forecastday'] as List).map((e) => Forecastday.fromJson(e),).toList());
  }
}

// Forecast
class Forecastday {
  late String date;
  late dynamic date_epoch;
  late Day day;
  late Astro astro;
  late List<Hour> hour;

  Forecastday(
      {required this.date,
      required this.date_epoch,
      required this.day,
      required this.astro,
      required this.hour});

  factory Forecastday.fromJson(Map m1) {
    return Forecastday(
        date: m1['date'],
        date_epoch: m1['date_epoch'],
        day: Day.fromJson(m1['day']),
        astro: Astro.fromJson(m1['astro']),
        hour: (m1['hour'] as List).map((e) => Hour.fromJson(e),).toList());
  }
}

// Forecastday
class Day {
  late dynamic maxtempC,
      mintempC,
      maxtempF,
      mintempF,
      avgtempC,
      avgtempF,
      maxwindMph,
      maxwindKph,
      totalprecipMm,
      totalprecipIn,
      totalsnowCm,
      avgvisKm,
      avgvisMiles,
      avghumidity,
      dailyWillItRain,
      dailyChanceOfRain,
      dailyWillItDnow,
      dailyChanceOfSnow,
      uv;
  late Condition condition;

  Day(
      {required this.maxtempC,
      required this.maxtempF,
      required this.mintempC,
      required this.mintempF,
      required this.avgtempC,
      required this.avgtempF,
      required this.maxwindMph,
      required this.maxwindKph,
      required this.totalprecipMm,
      required this.totalprecipIn,
      required this.totalsnowCm,
      required this.avgvisKm,
      required this.avgvisMiles,
      required this.avghumidity,
      required this.dailyWillItRain,
      required this.dailyChanceOfRain,
      required this.dailyWillItDnow,
      required this.dailyChanceOfSnow,
      required this.uv,
      required this.condition});

  factory Day.fromJson(Map m1) {
    return Day(
      maxtempC: m1['maxtemp_c'],
      maxtempF: m1['maxtemp_f'],
      mintempC: m1['mintemp_c'],
      mintempF: m1['mintemp_f'],
      avgtempC: m1['avgtemp_c'],
      avgtempF: m1['avgtemp_f'],
      maxwindMph: m1['maxwind_mph'],
      maxwindKph: m1['maxwind_kph'],
      totalprecipMm: m1['totalprecip_mm'],
      totalprecipIn: m1['totalprecip_in'],
      totalsnowCm: m1['totalsnow_cm'],
      avgvisKm: m1['avgvis_km'],
      avgvisMiles: m1['avgvis_miles'],
      avghumidity: m1['avghumidity'],
      dailyWillItRain: m1['daily_will_it_rain'],
      dailyChanceOfRain: m1['daily_chance_of_rain'],
      dailyWillItDnow: m1['daily_will_it_snow'],
      dailyChanceOfSnow: m1['daily_chance_of_snow'],
      uv: m1['uv'],
      condition: Condition.fromJson(m1['condition']),
    );
  }
}

// Forecastday

class Astro {
  late String sunrise, sunset, moonrise, moonset, moonPhase;
  late dynamic moonIllumination, isMoonUp, isSunUp;

  Astro(
      {required this.sunrise,
      required this.sunset,
      required this.moonrise,
      required this.moonset,
      required this.moonPhase,
      required this.moonIllumination,
      required this.isMoonUp,
      required this.isSunUp});

  factory Astro.fromJson(Map m1) {
    return Astro(
        sunrise: m1['sunrise'],
        sunset: m1['sunset'],
        moonrise: m1['moonrise'],
        moonset: m1['moonset'],
        moonPhase: m1['moon_phase'],
        moonIllumination: m1['moon_illumination'],
        isMoonUp: m1['is_moon_up'],
        isSunUp: m1['is_sun_up']);
  }
}

// Forecastday

class Hour {
  late dynamic time_epoch,
      time,
      temp_c,
      temp_f,
      is_day,
      wind_mph,
      wind_kph,
      wind_degree,
      wind_dir,
      pressure_mb,
      pressure_in,
      precip_mm,
      precip_in,
      snow_cm,
      humidity,
      cloud,
      feelslike_c,
      feelslike_f,
      windchill_c,
      windchill_f,
      heatindex_c,
      heatindex_f,
      dewpoint_c,
      dewpoint_f,
      will_it_rain,
      chance_of_rain,
      will_it_snow,
      chance_of_snow,
      vis_km,
      vis_miles,
      gust_mph,
      gust_kph,
      uv;
  late Condition condition;

  Hour(
      {required this.time_epoch,
      required this.time,
      required this.temp_c,
      required this.temp_f,
      required this.is_day,
      required this.wind_mph,
      required this.wind_kph,
      required this.wind_degree,
      required this.wind_dir,
      required this.pressure_mb,
      required this.pressure_in,
      required this.precip_mm,
      required this.precip_in,
      required this.snow_cm,
      required this.humidity,
      required this.cloud,
      required this.feelslike_c,
      required this.feelslike_f,
      required this.windchill_c,
      required this.windchill_f,
      required this.heatindex_c,
      required this.heatindex_f,
      required this.dewpoint_c,
      required this.dewpoint_f,
      required this.will_it_rain,
      required this.chance_of_rain,
      required this.will_it_snow,
      required this.chance_of_snow,
      required this.vis_km,
      required this.vis_miles,
      required this.gust_mph,
      required this.gust_kph,
      required this.uv,
      required this.condition});

  factory Hour.fromJson(Map m1) {
    return Hour(
      time_epoch: m1['time_epoch'],
      time: m1['time'],
      temp_c: m1['temp_c'],
      temp_f: m1['temp_f'],
      is_day: m1['is_day'],
      wind_mph: m1['wind_mph'],
      wind_kph: m1['wind_kph'],
      wind_degree: m1['wind_degree'],
      wind_dir: m1['wind_dir'],
      pressure_mb: m1['pressure_mb'],
      pressure_in: m1['pressure_in'],
      precip_mm: m1['precip_mm'],
      precip_in: m1['precip_in'],
      snow_cm: m1['snow_cm'],
      humidity: m1['humidity'],
      cloud: m1['cloud'],
      feelslike_c: m1['feelslike_c'],
      feelslike_f: m1['feelslike_f'],
      windchill_c: m1['windchill_c'],
      windchill_f: m1['windchill_f'],
      heatindex_c: m1['heatindex_c'],
      heatindex_f: m1['heatindex_f'],
      dewpoint_c: m1['dewpoint_c'],
      dewpoint_f: m1['dewpoint_f'],
      will_it_rain: m1['will_it_rain'],
      chance_of_rain: m1['chance_of_rain'],
      will_it_snow: m1['will_it_snow'],
      chance_of_snow: m1['chance_of_snow'],
      vis_km: m1['vis_km'],
      vis_miles: m1['vis_miles'],
      gust_mph: m1['gust_mph'],
      gust_kph: m1['gust_kph'],
      uv: m1['uv'],
      condition: Condition.fromJson(m1['condition']),
    );
  }
}
