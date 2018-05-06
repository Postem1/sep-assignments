require './city'

# The travelling salesman problem (TSP):
# Given a list of cities and the distances between each pair of cities,
# what is the shortest possible route?

# Nearest Neighbor algorithm:
# The salesman starts at a random city and repeatedly visits the nearest city until the destination has been reached. It quickly yields a short tour, but usually not the optimal one


def distance_between(city_1, city_2)
  Math.hypot(city_2.x - city_1.x, city_2.y - city_1.y)
end

def tsp_nearest_neighbor(cities_array, start_city, destination)
  start_city.visited = true
  path = [ [start_city.name, start_city.x, start_city.y] ]
  current_city = start_city

  while current_city != destination
    nearest_neighbor = cities_array[0]
    nearest_neighbor_dist = distance_between(start_city, destination)

    cities_array.each do |city|
      if city.visited == true
        next
      elsif distance_between(current_city, city) < nearest_neighbor_dist
        nearest_neighbor_dist = distance_between(current_city, city)
        nearest_neighbor = city
      end
    end

    path.push([nearest_neighbor.name, nearest_neighbor.x, nearest_neighbor.y])
    nearest_neighbor.visited = true
    current_city = nearest_neighbor
  end
  puts path.length
  p path
end


cities = [
  atl = City.new("Atlanta, GA",
    33.7489954,
   -84.3879824),

  nyc =  City.new("New York, NY",
    40.7127837,
   -74.0059413),

  la = City.new("Los Angeles, CA",
    34.0522342,
   -118.2436849),

  chicag0 = City.new("Chicago, IL",
    41.8781136,
   -87.6297982),

  houston = City.new("Houston, TX",
    29.7604267,
   -95.3698028),

   philly = City.new("Philadelphia, PA",
    39.9525839,
   -75.1652215),

  phoenix =  City.new("Phoenix, AZ",
    33.4483771,
   -112.0740373),

  san_antonio = City.new("San Antonio, TX",
    29.4241219,
   -98.49362819999999),

   sd = City.new("San Diego, CA",
    32.715738,
   -117.1610838),

  dallas = City.new("Dallas, TX",
    32.7766642,
   -96.79698789999999),

  sj = City.new("San Jose, CA",
    37.3382082,
   -121.8863286),

  austin = City.new("Austin, TX",
    30.267153,
   -97.7430608),

  indy = City.new("Indianapolis, IN",
    39.768403,
   -86.158068),

  jaguars = City.new("Jacksonville, FL",
    30.3321838,
   -81.65565099999999),

  san_fran = City.new("San Francisco, CA",
    37.7749295,
   -122.4194155),

  columbus = City.new("Columbus, OH",
    39.9611755,
   -82.99879419999999),

  charlotte = City.new("Charlotte, NC",
    35.2270869,
   -80.8431267),

  fort_w = City.new("Fort Worth, TX",
    32.7554883,
   -97.3307658),

  detroit = City.new("Detroit, MI",
    42.331427,
   -83.0457538),

  el_paso = City.new("El Paso, TX",
    31.7775757,
   -106.4424559),

  memphis = City.new("Memphis, TN",
    35.1495343,
   -90.0489801),

  seattle = City.new("Seattle, WA",
    47.6062095,
   -122.3320708),

  denver = City.new("Denver, CO",
    39.7392358,
   -104.990251),

  dc = City.new("Washington, DC",
    38.9071923,
   -77.0368707),

  boston = City.new("Boston, MA",
    42.3600825,
   -71.0588801),

  nash = City.new("Nashville, TN",
    36.1626638,
   -86.7816016),

  balti = City.new("Baltimore, MD",
    39.2903848,
   -76.6121893),

  okc = City.new("Oklahoma City, OK",
    35.4675602,
   -97.5164276),

  louisville = City.new("Louisville, KY",
    38.2526647,
   -85.7584557),

  portland = City.new("Portland, OR",
    45.5230622,
   -122.6764816),

  vegas = City.new("Las Vegas, NV",
    36.1699412,
   -115.1398296),

  milwaukee = City.new("Milwaukee, WI",
    43.0389025,
   -87.9064736),

  albq = City.new("Albuquerque, NM",
    35.0853336,
   -106.6055534),

  tuscon = City.new("Tucson, AZ",
    32.2217429,
   -110.926479),

  fresno = City.new("Fresno, NV",
    36.7468422,
   -119.7725868),

  saccramento = City.new("Sacramento, CA",
    38.5815719,
   -121.4943996),

  lbc = City.new("Long Beach, CA",
    33.7700504,
   -118.1937395),

  kansas_city = City.new("Kansas City, MI",
    39.0997265,
   -94.5785667),

  mesa = City.new("Mesa, AZ",
    33.4151843,
   -111.8314724),

  virginia_beach = City.new("Virginia Beach, VA",
    36.8529263,
   -75.97798499999999),

  colorado_spr = City.new("Colorado Springs, CO",
    38.8338816,
   -104.8213634),

  omaha = City.new("Omaha, Nebraska",
    41.2523634,
   -95.99798829999999),

  raleigh = City.new("Raleigh, NC",
    35.7795897,
   -78.6381787),

  mia = City.new("Miami, FL",
    25.7616798,
   -80.1917902),

  oakland = City.new("Oakland, CA",
    37.8043637,
   -122.2711137),

  minnea = City.new("Minneapolis, MI",
    44.977753,
   -93.2650108),

  tulsa = City.new("Tulsa, OK",
    36.1539816,
   -95.99277500000001),

  cleveland = City.new("Cleveland, OH",
    41.49932,
   -81.6943605),

  wichita = City.new("Wichita, KS",
    37.688889,
   -97.336111),

  arl_tx = City.new("Arlington, TX ",
    32.735687,
   -97.10806559999999),

  n_orleans = City.new("New Orleans, LA",
    29.95106579999999,
   -90.0715323),

  bakersfield = City.new("Bakersfield, CA",
    35.3732921,
   -119.0187125),

  tampa = City.new("Tampa, FL",
    27.950575,
   -82.4571776),

  hawaii = City.new("Honolulu, HI",
    21.3069444,
   -157.8583333),

  aurora = City.new("Aurora, CO",
    39.7294319,
   -104.8319195),

  anaheim = City.new("Anaheim, CA",
    33.8352932,
   -117.9145036),

  santa_anna = City.new("Santa Ana, CA",
    33.7455731,
   -117.8678338),

  st_louis = City.new("St. Louis, MI",
    38.6270025,
   -90.19940419999999),

  riverside = City.new("Riverside, CA",
    33.9533487,
   -117.3961564),

  corpus = City.new("Corpus Christi, TX",
    27.8005828,
   -97.39638099999999),

  lexington = City.new("Lexington, KY",
    38.0405837,
   -84.5037164),

  pitt = City.new("Pittsburgh, PA",
    40.44062479999999,
   -79.9958864),

  alaska = City.new("Anchorage, Alaska",
    61.2180556,
   -149.9002778),

  stockton = City.new("Stockton, CA",
    37.9577016,
   -121.2907796),

  cinnci = City.new("Cincinnati, OH",
    39.1031182,
   -84.5120196),

  st_paul = City.new("St. Paul, Minnesota",
    44.9537029,
   -93.0899578),

  toledo = City.new("Toledo, OH",
    41.6639383,
   -83.55521200000001),

  greensboro = City.new("Greensboro, NC",
    36.0726354,
   -79.7919754),

  newark = City.new("Newark, NJ",
    40.735657,
   -74.1723667),

  plano = City.new("Plano, TX",
    33.0198431,
   -96.6988856),

  henderson = City.new("Henderson, Nevada",
    36.0395247,
   -114.9817213),

  lincoln = City.new("Lincoln, Nebraska",
    40.8257625,
   -96.6851982),

  buffalo = City.new("Buffalo, NY",
    42.88644679999999,
   -78.8783689),

  jersey = City.new("Jersey City, New Jersey",
    40.72815749999999,
   -74.0776417),

  chula = City.new("Chula Vista, CA",
    32.6400541,
   -117.0841955),

  frt_wayne = City.new("Fort Wayne, IN",
    41.079273,
   -85.1393513),

  orl = City.new("Orlando, FL",
    28.5383355,
   -81.3792365),

  st_pete = City.new("St. Petersburg, FL",
    27.773056,
   -82.64),

  chandler = City.new("Chandler, AZ",
    33.3061605,
   -111.8412502),

  laredo = City.new("Laredo, TX",
    27.5305671,
   -99.48032409999999),

  norfolk = City.new("Norfolk, VA",
    36.8507689,
   -76.28587259999999),

  durham = City.new("Durham, NC",
    35.9940329,
   -78.898619),

  madison = City.new("Madison, Wisconsin",
    43.0730517,
   -89.4012302),

  lubb = City.new("Lubbock, TX",
    33.5778631,
   -101.8551665),

  irvine = City.new("Irvine, CA",
    33.6839473,
   -117.7946942),

  winst = City.new("Winston-Salem, NC",
    36.09985959999999,
   -80.244216),

  glendale = City.new("Glendale, AZ",
    33.5386523,
   -112.1859866),

  garland = City.new("Garland, TX",
    32.912624,
   -96.63888329999999),

  hialeah = City.new("Hialeah, FL",
    25.8575963,
   -80.2781057),

  reno = City.new("Reno, NV",
    39.5296329,
   -119.8138027),

  chesap = City.new("Chesapeake, VA",
    36.7682088,
   -76.2874927),

  gilbert = City.new("Gilbert, AZ",
    33.3528264,
   -111.789027),

  baton = City.new("Baton Rouge, LA",
    30.4582829,
   -91.1403196),

  irving = City.new("Irving, TX",
    32.8140177,
   -96.9488945),

  scottsdale = City.new("Scottsdale, AZ",
    33.4941704,
   -111.9260519),

  nlv = City.new("North Las Vegas, NV",
    36.1988592,
   -115.1175013),

  fremont = City.new("Fremont, CA",
    37.5482697,
   -121.9885719),

  boise = City.new("Boise City, Idaho",
    43.6187102,
   -116.2146068),

  richmond = City.new("Richmond, VA",
    37.5407246,
   -77.4360481),

  bernardino = City.new("San Bernardino, CA",
    34.1083449,
   -117.2897652)
]

# tsp_nearest_neighbor(cities, mia, orl)
#
# tsp_nearest_neighbor(cities, jaguars, mia)
#
# tsp_nearest_neighbor(cities, mia, la)
#
tsp_nearest_neighbor(cities, la, dallas)
