module LuciansLusciousLasagna exposing (elapsedTimeInMinutes, expectedMinutesInOven, preparationTimeInMinutes)

-- TODO: define the expectedMinutesInOven constant
-- TODO: define the preparationTimeInMinutes function
-- TODO: define the elapsedTimeInMinutes function


expectedMinutesInOven : number
expectedMinutesInOven =
    40


preparationTimeInMinutes : number -> number
preparationTimeInMinutes layers =
    2 * layers


elapsedTimeInMinutes : number -> number -> number
elapsedTimeInMinutes layers ovenMins =
    preparationTimeInMinutes layers + ovenMins
