Vehicles = {}

-- [[ Vehicle Authorization ]] --
Vehicles.AuthorizedVehiclesSASP = {
    -- Grade 0 | Cadet
    [0] = {

    },
    -- Grade 1 | Trooper
    [1] = {

    },
    -- Grade 2 | Sergeant
    [2] = {

    },
    -- Grade 3 | Lieutenant
    [3] = {

    },
    -- Grade 4 | Captain
    [4] = {

    },
    -- Grade 5 | Assistant Chief
    [5] = {

    },
    -- Grade 6 | Chief
    [6] = {

    },
    -- Grade 7 | Assistant Commissioner
    [7] = {

    },
    -- Grade 8 | Deputy Commissioner
    [8] = {

    },
    -- Grade 9 | Commissioner
    [9] = {

    },
}

Vehicles.AuthorizedVehiclesLSPD = {
    -- Grade 0 | Trainee / Ride-along
    [0] = {
        ["pdcvpi"] = "Crown Victoria | Patrol",
    },
    -- Grade 1 | Officer I
    [1] = {
        ["pdcvpi"] = "Crown Victoria | Patrol",
        ["pdtaurus"] = "Taurus | Patrol",
    },
    -- Grade 2 | Officer II
    [2] = {     
        ["pdcvpi"] = "Crown Victoria | Patrol",
        ["pdtaurus"] = "Taurus | Patrol",
        ["pd14charger"] = "'14 Charger | Patrol",
    },
    -- Grade 3 | Officer III
    [3] = {
        ["pdcvpi"] = "Crown Victoria | Patrol",
        ["pdtaurus"] = "Taurus | Patrol",
        ["pd14charger"] = "'14 Charger | Patrol",
    },
    -- Grade 4 | Corporal
    [4] = {
        ["pdcvpi"] = "Crown Victoria | Patrol",
        ["pdtaurus"] = "Taurus | Patrol",
        ["pd14charger"] = "'14 Charger | Patrol",
        ["pd3expedition"] = "Expedition | Patrol",
    },
    -- Grade 5 | Sergeant I
    [5] = {
        ["pdcvpi"] = "Crown Victoria | Patrol",
        ["pdtaurus"] = "Taurus | Patrol",
        ["pd14charger"] = "'14 Charger | Patrol",
        ["pdfpiu"] = "FPIU | Patrol",
        ["pdexplorer"] = "Explorer | Patrol",
        ["pd3expedition"] = "Expedition | Patrol",
        ["pdcamaro"] = "Camaro | Pursuit",
    },
    -- Grade 6 | Sergeant II
    [6] = {
        ["pdcvpi"] = "Crown Victoria | Patrol",
        ["pdtaurus"] = "Taurus | Patrol",
        ["pd14charger"] = "'14 Charger | Patrol",
        ["pdfpiu"] = "FPIU | Patrol",
        ["pdexplorer"] = "Explorer | Patrol",
        ["pd3expedition"] = "Expedition | Patrol",
        ["pdcamaro"] = "Camaro | Pursuit",
    },
    -- Grade 7 | Staff Sergeant I
    [7] = {
        ["pdcvpi"] = "Crown Victoria | Patrol",
        ["pdtaurus"] = "Taurus | Patrol",
        ["pd14charger"] = "'14 Charger | Patrol",
        ["pd18charger"] = "'18 Charger | Pursuit",
        ["pdtahoe"] = "'21 Tahoe | Patrol",
        ["pdfpiu"] = "FPIU | Patrol",
        ["pdexplorer"] = "Explorer | Patrol",
        ["pd3expedition"] = "Expedition | Patrol",
        ["pdcamaro"] = "Camaro | Pursuit",
    },
    -- Grade 8 | Staff Sergeant II
    [8] = {
        ["pdcvpi"] = "Crown Victoria | Patrol",
        ["pdtaurus"] = "Taurus | Patrol",
        ["pd14charger"] = "'14 Charger | Patrol",
        ["pd18charger"] = "'18 Charger | Pursuit",
        ["pdtahoe"] = "'21 Tahoe | Patrol",
        ["pdfpiu"] = "FPIU | Patrol",
        ["pdexplorer"] = "Explorer | Patrol",
        ["pd3expedition"] = "Expedition | Patrol",
        ["pdcamaro"] = "Camaro | Pursuit",
    },
    -- Grade 9 | Lieutenant I
    [9] = {
        ["pdcvpi"] = "Crown Victoria | Patrol",
        ["pdtaurus"] = "Taurus | Patrol",
        ["pd14charger"] = "'14 Charger | Patrol",
        ["pd18charger"] = "'18 Charger | Pursuit",
        ["pdtahoe"] = "'21 Tahoe | Patrol",
        ["pdfpiu"] = "FPIU | Patrol",
        ["pdexplorer"] = "Explorer | Patrol",
        ["pd3expedition"] = "Expedition | Patrol",
        ["pdcamaro"] = "Camaro | Pursuit",
    },
    -- Grade 10 | Lieutenant II
    [10] = {
        ["pdcvpi"] = "Crown Victoria | Patrol",
        ["pdtaurus"] = "Taurus | Patrol",
        ["pd14charger"] = "'14 Charger | Patrol",
        ["pd18charger"] = "'18 Charger | Pursuit",
        ["pdtahoe"] = "'21 Tahoe | Patrol",
        ["pdfpiu"] = "FPIU | Patrol",
        ["pdexplorer"] = "Explorer | Patrol",
        ["pd3expedition"] = "Expedition | Patrol",
        ["pdcamaro"] = "Camaro | Pursuit",
    },
    -- Grade 11 | Captain I
    [11] = {
        ["pdcvpi"] = "Crown Victoria | Patrol",
        ["pdtaurus"] = "Taurus | Patrol",
        ["pd14charger"] = "'14 Charger | Patrol",
        ["pd18charger"] = "'18 Charger | Pursuit",
        ["pdtahoe"] = "'21 Tahoe | Patrol",
        ["pdfpiu"] = "FPIU | Patrol",
        ["pdexplorer"] = "Explorer | Patrol",
        ["pd3expedition"] = "Expedition | Patrol",
        ["pdram"] = "Ram | CVE",
        ["pdcamaro"] = "Camaro | Pursuit",
    },
    -- Grade 12 | Captain II
    [12] = {
        ["pdcvpi"] = "Crown Victoria | Patrol",
        ["pdtaurus"] = "Taurus | Patrol",
        ["pd14charger"] = "'14 Charger | Patrol",
        ["pd18charger"] = "'18 Charger | Pursuit",
        ["pdtahoe"] = "'21 Tahoe | Patrol",
        ["pdfpiu"] = "FPIU | Patrol",
        ["pdexplorer"] = "Explorer | Patrol",
        ["pd3expedition"] = "Expedition | Patrol",
        ["pdram"] = "Ram | CVE",
        ["pdcamaro"] = "Camaro | Pursuit",
    },
    -- Grade 13 | Captain III
    [13] = {
        ["pdcvpi"] = "Crown Victoria | Patrol",
        ["pdtaurus"] = "Taurus | Patrol",
        ["pd14charger"] = "'14 Charger | Patrol",
        ["pd18charger"] = "'18 Charger | Pursuit",
        ["pdtahoe"] = "'21 Tahoe | Patrol",
        ["pdfpiu"] = "FPIU | Patrol",
        ["pdexplorer"] = "Explorer | Patrol",
        ["pd3expedition"] = "Expedition | Patrol",
        ["pdram"] = "Ram | CVE",
        ["pdcamaro"] = "Camaro | Pursuit",
    },
    -- Grade 14 | Commander
    [14] = {
        ["pdcvpi"] = "Crown Victoria | Patrol",
        ["pdtaurus"] = "Taurus | Patrol",
        ["pd14charger"] = "'14 Charger | Patrol",
        ["pd18charger"] = "'18 Charger | Pursuit",
        ["pdtahoe"] = "'21 Tahoe | Patrol",
        ["pdfpiu"] = "FPIU | Patrol",
        ["pdexplorer"] = "Explorer | Patrol",
        ["pd3expedition"] = "Expedition | Patrol",
        ["pdram"] = "Ram | CVE",
        ["pdcamaro"] = "Camaro | Pursuit",
    },
    -- Grade 15 | Deputy Chief of Police
    [15] = {
        ["pdcvpi"] = "Crown Victoria | Patrol",
        ["pdtaurus"] = "Taurus | Patrol",
        ["pd14charger"] = "'14 Charger | Patrol",
        ["pd18charger"] = "'18 Charger | Pursuit",
        ["pdtahoe"] = "'21 Tahoe | Patrol",
        ["pdfpiu"] = "FPIU | Patrol",
        ["pdexplorer"] = "Explorer | Patrol",
        ["pd3expedition"] = "Expedition | Patrol",
        ["pdram"] = "Ram | CVE",
        ["pdcamaro"] = "Camaro | Pursuit",
    },
    -- Grade 16 | Assistant Chief of Police
    [16] = {
        ["pdcvpi"] = "Crown Victoria | Patrol",
        ["pdtaurus"] = "Taurus | Patrol",
        ["pd14charger"] = "'14 Charger | Patrol",
        ["pd18charger"] = "'18 Charger | Pursuit",
        ["pdtahoe"] = "'21 Tahoe | Patrol",
        ["pdfpiu"] = "FPIU | Patrol",
        ["pdexplorer"] = "Explorer | Patrol",
        ["pd3expedition"] = "Expedition | Patrol",
        ["pdram"] = "Ram | CVE",
        ["pdcamaro"] = "Camaro | Pursuit",
    },
    -- Grade 17 | Chief of Police 
    [17] = {
        ["pdcvpi"] = "Crown Victoria | Patrol",
        ["pdtaurus"] = "Taurus | Patrol",
        ["pd14charger"] = "'14 Charger | Patrol",
        ["pd18charger"] = "'18 Charger | Pursuit",
        ["pdtahoe"] = "'21 Tahoe | Patrol",
        ["pdfpiu"] = "FPIU | Patrol",
        ["pdexplorer"] = "Explorer | Patrol",
        ["pd3expedition"] = "Expedition | Patrol",
        ["pdram"] = "Ram | CVE",
        ["pdcamaro"] = "Camaro | Pursuit",
        ["hellkitty"] = "'15 Charger Hellcat | Unmarked"
    },
}

Vehicles.AuthorizedVehiclesBCSO = {
    [0] = {
        ['so11vic'] = "2011 Crown Victoria",
        ['so12caprice'] = "2012 Caprice",
        ['so18taurus'] = "2018 Ford Taurus",
        ['so14charger'] = "2014 Dodge Charger",
    },
    [1] = {
        ['so11vic'] = "2011 Crown Victoria",
        ['so12caprice'] = "2012 Caprice",
        ['so18taurus'] = "2018 Ford Taurus",
        ['so14charger'] = "2014 Dodge Charger",
    },
    [2] = {
        ['so11vic'] = "2011 Crown Victoria",
        ['so12caprice'] = "2012 Caprice",
        ['so18taurus'] = "2018 Ford Taurus",
        ['so14charger'] = "2014 Dodge Charger",
    },
    [3] = {
        ['so11vic'] = "2011 Crown Victoria",
        ['so12caprice'] = "2012 Caprice",
        ['so18taurus'] = "2018 Ford Taurus",
        ['so14charger'] = "2014 Dodge Charger",
        ['so14tahoe'] = "2014 Tahoe",
        ['so16explorer'] = "2016 Explorer",
        ['so19tahoe'] = "2019 Tahoe",
        ['so19camaro'] = "2019 Camaro",
        ['so18charger'] = "2018 Dodge Charger",
    },
    [4] = {
        ['so11vic'] = "2011 Crown Victoria",
        ['so12caprice'] = "2012 Caprice",
        ['so18taurus'] = "2018 Ford Taurus",
        ['so14charger'] = "2014 Dodge Charger",
        ['so14tahoe'] = "2014 Tahoe",
        ['so16explorer'] = "2016 Explorer",
        ['so19tahoe'] = "2019 Tahoe",
        ['so19camaro'] = "2019 Camaro",
        ['so18charger'] = "2018 Dodge Charger",
    },
    [5] = {
        ['so11vic'] = "2011 Crown Victoria",
        ['so12caprice'] = "2012 Caprice",
        ['so18taurus'] = "2018 Ford Taurus",
        ['so14charger'] = "2014 Dodge Charger",
        ['so14tahoe'] = "2014 Tahoe",
        ['so16explorer'] = "2016 Explorer",
        ['so19tahoe'] = "2019 Tahoe",
        ['so14ram'] = "2014 Ram",
        ['so15f150'] = "2015 F-150",
        ['so19silverado'] = "2019 Silverado",
        ['so19camaro'] = "2019 Camaro",
        ['so18charger'] = "2018 Dodge Charger",
    },
    [6] = {
        ['so11vic'] = "2011 Crown Victoria",
        ['so12caprice'] = "2012 Caprice",
        ['so18taurus'] = "2018 Ford Taurus",
        ['so14charger'] = "2014 Dodge Charger",
        ['so14tahoe'] = "2014 Tahoe",
        ['so16explorer'] = "2016 Explorer",
        ['so19tahoe'] = "2019 Tahoe",
        ['so14ram'] = "2014 Ram",
        ['so15f150'] = "2015 F-150",
        ['so19silverado'] = "2019 Silverado",
        ['so19camaro'] = "2019 Camaro",
        ['so18charger'] = "2018 Dodge Charger",
    },
    [7] = {
        ['so11vic'] = "2011 Crown Victoria",
        ['so12caprice'] = "2012 Caprice",
        ['so18taurus'] = "2018 Ford Taurus",
        ['so14charger'] = "2014 Dodge Charger",
        ['so14tahoe'] = "2014 Tahoe",
        ['so16explorer'] = "2016 Explorer",
        ['so19tahoe'] = "2019 Tahoe",
        ['so14ram'] = "2014 Ram",
        ['so15f150'] = "2015 F-150",
        ['so19silverado'] = "2019 Silverado",
        ['so19camaro'] = "2019 Camaro",
        ['so18charger'] = "2018 Dodge Charger",
    },
    [8] = {
        ['so11vic'] = "2011 Crown Victoria",
        ['so12caprice'] = "2012 Caprice",
        ['so18taurus'] = "2018 Ford Taurus",
        ['so14charger'] = "2014 Dodge Charger",
        ['so14tahoe'] = "2014 Tahoe",
        ['so16explorer'] = "2016 Explorer",
        ['so19tahoe'] = "2019 Tahoe",
        ['so14ram'] = "2014 Ram",
        ['so15f150'] = "2015 F-150",
        ['so19silverado'] = "2019 Silverado",
        ['so19camaro'] = "2019 Camaro",
        ['so18charger'] = "2018 Dodge Charger",
    },
    [9] = {
        ['so11vic'] = "2011 Crown Victoria",
        ['so12caprice'] = "2012 Caprice",
        ['so18taurus'] = "2018 Ford Taurus",
        ['so14charger'] = "2014 Dodge Charger",
        ['so14tahoe'] = "2014 Tahoe",
        ['so16explorer'] = "2016 Explorer",
        ['so19tahoe'] = "2019 Tahoe",
        ['so14ram'] = "2014 Ram",
        ['so15f150'] = "2015 F-150",
        ['so19silverado'] = "2019 Silverado",
        ['so19camaro'] = "2019 Camaro",
        ['so18charger'] = "2018 Dodge Charger",
    },
    [10] = {
        ['so11vic'] = "2011 Crown Victoria",
        ['so12caprice'] = "2012 Caprice",
        ['so18taurus'] = "2018 Ford Taurus",
        ['so14charger'] = "2014 Dodge Charger",
        ['so14tahoe'] = "2014 Tahoe",
        ['so16explorer'] = "2016 Explorer",
        ['so19tahoe'] = "2019 Tahoe",
        ['so14ram'] = "2014 Ram",
        ['so15f150'] = "2015 F-150",
        ['so19silverado'] = "2019 Silverado",
        ['so19camaro'] = "2019 Camaro",
        ['so18charger'] = "2018 Dodge Charger",
    },
    [11] = {
        ['so11vic'] = "2011 Crown Victoria",
        ['so12caprice'] = "2012 Caprice",
        ['so18taurus'] = "2018 Ford Taurus",
        ['so14charger'] = "2014 Dodge Charger",
        ['so14tahoe'] = "2014 Tahoe",
        ['so16explorer'] = "2016 Explorer",
        ['so19tahoe'] = "2019 Tahoe",
        ['so14ram'] = "2014 Ram",
        ['so15f150'] = "2015 F-150",
        ['so19silverado'] = "2019 Silverado",
        ['so19camaro'] = "2019 Camaro",
        ['so18charger'] = "2018 Dodge Charger",
    },
    [12] = {
        ['so11vic'] = "2011 Crown Victoria",
        ['so12caprice'] = "2012 Caprice",
        ['so18taurus'] = "2018 Ford Taurus",
        ['so14charger'] = "2014 Dodge Charger",
        ['so14tahoe'] = "2014 Tahoe",
        ['so16explorer'] = "2016 Explorer",
        ['so19tahoe'] = "2019 Tahoe",
        ['so14ram'] = "2014 Ram",
        ['so15f150'] = "2015 F-150",
        ['so19silverado'] = "2019 Silverado",
        ['so19camaro'] = "2019 Camaro",
        ['so18charger'] = "2018 Dodge Charger",
    },
}

Vehicles.AuthorizedVehiclesSAFD = {
    [0] = {
        ['fdnyambo'] = "2018 Ford XLT F350 Super Duty",

        ['es4'] = "Blaine County | Emergency Squad 4 | F450 Super Duty Single Cab",
        ['pbems'] = "Paleto Bay | Medic 56 | F450 Super Duty Single Cab",
        ['medic10'] = "Pillbox | Medic 10 | F450 Super Duty Single Cab",
        ['medic27'] = "Pillbox | Medic 25 | F450 Super Duty Single Cab",
        ['medic25'] = "Rockford | Medic 25 | F450 Super Duty Single Cab",

        ['brush2'] = "Blaine County | Brush 2 | F450 Heavy Duty Brush",
    },
    [1] = {
        ['fdnyambo'] = "2018 Ford XLT F350 SuperDuty",

        ['es4'] = "Blaine County | Emergency Squad 4 | F450 Super Duty Single Cab",
        ['pbems'] = "Paleto Bay | Medic 56 | F450 Super Duty Single Cab",
        ['medic10'] = "Pillbox | Medic 10 | F450 Super Duty Single Cab",
        ['medic27'] = "Pillbox | Medic 25 | F450 Super Duty Single Cab",
        ['medic25'] = "Rockford | Medic 25 | F450 Super Duty Single Cab",

        ['brush2'] = "Blaine County | Brush 2 | F450 Heavy Duty Brush",
    },
    [2] = {
        ['fdnyambo'] = "2018 Ford XLT F350 SuperDuty",

        ['es4'] = "Blaine County | Emergency Squad 4 | F450 Super Duty Single Cab",
        ['pbems'] = "Paleto Bay | Medic 56 | F450 Super Duty Single Cab",
        ['medic10'] = "Pillbox | Medic 10 | F450 Super Duty Single Cab",
        ['medic27'] = "Pillbox | Medic 25 | F450 Super Duty Single Cab",
        ['medic25'] = "Rockford | Medic 25 | F450 Super Duty Single Cab",

        ['brush2'] = "Blaine County | Brush 2 | F450 Heavy Duty Brush",
    },
    [3] = {
        ['fdnyambo'] = "2018 Ford XLT F350 SuperDuty",

        ['es4'] = "Blaine County | Emergency Squad 4 | F450 Super Duty Single Cab",
        ['pbems'] = "Paleto Bay | Medic 56 | F450 Super Duty Single Cab",
        ['medic10'] = "Pillbox | Medic 10 | F450 Super Duty Single Cab",
        ['medic27'] = "Pillbox | Medic 25 | F450 Super Duty Single Cab",
        ['medic25'] = "Rockford | Medic 25 | F450 Super Duty Single Cab",

        ['brush2'] = "Blaine County | Brush 2 | F450 Heavy Duty Brush",

        ['squad2'] = "Los Santos | Squad 2 | F450 Single Cab",
        ["squadtrailer"] = "Squad 2 Trailer",
    },
    [4] = {
        ['fdnyambo'] = "2018 Ford XLT F350 SuperDuty",

        ['es4'] = "Blaine County | Emergency Squad 4 | F450 Super Duty Single Cab",
        ['pbems'] = "Paleto Bay | Medic 56 | F450 Super Duty Single Cab",
        ['medic10'] = "Pillbox | Medic 10 | F450 Super Duty Single Cab",
        ['medic27'] = "Pillbox | Medic 25 | F450 Super Duty Single Cab",
        ['medic25'] = "Rockford | Medic 25 | F450 Super Duty Single Cab",

        ['brush2'] = "Blaine County | Brush 2 | F450 Heavy Duty Brush",            

        ['squad2'] = "Los Santos | Squad 2 | F450 Single Cab",
        ["squadtrailer"] = "Squad 2 Trailer",
    },
    [5] = {
        ['fdnyambo'] = "2018 Ford XLT F350 SuperDuty",

        ['es4'] = "Blaine County | Emergency Squad 4 | F450 Super Duty Single Cab",
        ['pbems'] = "Paleto Bay | Medic 56 | F450 Super Duty Single Cab",
        ['medic10'] = "Pillbox | Medic 10 | F450 Super Duty Single Cab",
        ['medic27'] = "Pillbox | Medic 25 | F450 Super Duty Single Cab",
        ['medic25'] = "Rockford | Medic 25 | F450 Super Duty Single Cab",

        ['brush2'] = "Blaine County | Brush 2 | F450 Heavy Duty Brush",
        
        ['squad2'] = "Los Santos | Squad 2 | F450 Single Cab",
        ["squadtrailer"] = "Squad 2 Trailer",
    },
    [6] = {
        ['fdnyambo'] = "2018 Ford XLT F350 SuperDuty",
 
        ['es4'] = "Blaine County | Emergency Squad 4 | F450 Super Duty Single Cab",
        ['pbems'] = "Paleto Bay | Medic 56 | F450 Super Duty Single Cab",
        ['medic10'] = "Pillbox | Medic 10 | F450 Super Duty Single Cab",
        ['medic27'] = "Pillbox | Medic 25 | F450 Super Duty Single Cab",
        ['medic25'] = "Rockford | Medic 25 | F450 Super Duty Single Cab",

        ['brush2'] = "Blaine County | Brush 2 | F450 Heavy Duty Brush",

        ['squad2'] = "Los Santos | Squad 2 | F450 Single Cab",
        ["squadtrailer"] = "Squad 2 Trailer",
    },
    [7] = {
        ['fdnyambo'] = "2018 Ford XLT F350 SuperDuty",
 
        ['es4'] = "Blaine County | Emergency Squad 4 | F450 Super Duty Single Cab",
        ['pbems'] = "Paleto Bay | Medic 56 | F450 Super Duty Single Cab",
        ['medic10'] = "Pillbox | Medic 10 | F450 Super Duty Single Cab",
        ['medic27'] = "Pillbox | Medic 25 | F450 Super Duty Single Cab",
        ['medic25'] = "Rockford | Medic 25 | F450 Super Duty Single Cab",

        ['brush2'] = "Blaine County | Brush 2 | F450 Heavy Duty Brush",

        ['squad2'] = "Los Santos | Squad 2 | F450 Single Cab",
        ["squadtrailer"] = "Squad 2 Trailer",
    },
    [8] = {
        ['fdnyambo'] = "2018 Ford XLT F350 SuperDuty",
        ['bat2'] = "Ford F-150",

        ['es4'] = "Blaine County | Emergency Squad 4 | F450 Super Duty Single Cab",
        ['pbems'] = "Paleto Bay | Medic 56 | F450 Super Duty Single Cab",
        ['medic10'] = "Pillbox | Medic 10 | F450 Super Duty Single Cab",
        ['medic27'] = "Pillbox | Medic 25 | F450 Super Duty Single Cab",
        ['medic25'] = "Rockford | Medic 25 | F450 Super Duty Single Cab",

        ['brush2'] = "Blaine County | Brush 2 | F450 Heavy Duty Brush",
        
        ['squad2'] = "Los Santos | Squad 2 | F450 Single Cab",
        ["squadtrailer"] = "Squad 2 Trailer",
    },
    [9] = {
        ['fdnyambo'] = "2018 Ford XLT F350 SuperDuty",
        ['bat2'] = "Ford F-150",
 
        ['es4'] = "Blaine County | Emergency Squad 4 | F450 Super Duty Single Cab",
        ['pbems'] = "Paleto Bay | Medic 56 | F450 Super Duty Single Cab",
        ['medic10'] = "Pillbox | Medic 10 | F450 Super Duty Single Cab",
        ['medic27'] = "Pillbox | Medic 25 | F450 Super Duty Single Cab",
        ['medic25'] = "Rockford | Medic 25 | F450 Super Duty Single Cab",

        ['brush2'] = "Blaine County | Brush 2 | F450 Heavy Duty Brush",

        ['squad2'] = "Los Santos | Squad 2 | F450 Single Cab",
        ["squadtrailer"] = "Squad 2 Trailer",
    },
    [10] = {
        ['fdnyambo'] = "2018 Ford XLT F350 SuperDuty",
        ['bat2'] = "Ford F-150",

        ['es4'] = "Blaine County | Emergency Squad 4 | F450 Super Duty Single Cab",
        ['pbems'] = "Paleto Bay | Medic 56 | F450 Super Duty Single Cab",
        ['medic10'] = "Pillbox | Medic 10 | F450 Super Duty Single Cab",
        ['medic27'] = "Pillbox | Medic 25 | F450 Super Duty Single Cab",
        ['medic25'] = "Rockford | Medic 25 | F450 Super Duty Single Cab",

        ['brush2'] = "Blaine County | Brush 2 | F450 Heavy Duty Brush",

        ['squad2'] = "Los Santos | Squad 2 | F450 Single Cab",
        ["squadtrailer"] = "Squad 2 Trailer",
    },
}