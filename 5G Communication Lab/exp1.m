viewer = siteviewer("Buildings","poornima.osm","Basemap","topographic");

tx = txsite("Name", "Small cell transmitter", "Latitude", 26.770703 , "Longitude", 75.844789, "AntennaHeight", 20, "TransmitterPower", 20, "TransmitterFrequency",28e9);
show(tx);

rtpm = propagationModel("raytracing", "Method", "sbr", "MaxNumReflections", 0, "BuildingsMaterial", "perfect-reflector", "TerrainMaterial", "perfect-reflector");
coverage(tx, rtpm, "SignalStrengths", -120:-5, "MaxRange", 250, "Resolution", 3, "Transparency", 0.6);

rx = rxsite("Name", "Small cell receiver", "Latitude", 26.768983 , "Longitude", 75.848142 , "AntennaHeight", 5);

los(tx,rx);

rtpm.MaxNumReflections = 3;
clearMap(viewer);
show(tx);
show(rx);

raytrace(tx,rx,rtpm);

%Compute the received power.%
ss = sigstrength(rx,tx,rtpm);
disp("Received power using perfect reflection: " + ss + " dBm");

%Update the model to use concrete for the buildings and terrain materials%
rtpm.BuildingsMaterial = "concrete";
rtpm.TerrainMaterial = "concrete";

raytrace(tx,rx,rtpm);
ss = sigstrength(rx,tx,rtpm);
disp("Received Power using concrete materials :" + ss + "dBm");