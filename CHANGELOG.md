## Changed in Version 0.2.6

- The user can now name the used PVs

## Changed in Version 0.2.5

- Separated storage and cate helm chart. Otherwise, changes in the 
  storage configuration might cause surprises like data lost, or the necessity to 
  completely delete the kubernetes configuration.  
- Added lint tests for the chart config
- Changed from travis to appveyor for building and deploying 
  the chart
- Added an S3 storage provider
- Added a Dockerfile to configure a goofys storage provider to an S3 storage  

## Changed in Version 0.2.4

- Added a clusterrolebinding allowing to manipulate pods

## Changed in Version 0.2.3

- Changed from jupyterhub to xcube hub