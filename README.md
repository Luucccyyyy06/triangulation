# triangulation
finding a location to meet up with friends from different areas

__User process__
* Enter the 2< locations to start from
* Enter each persons mode of travel
* Choose approx journey length of each:
    * Choose whether this is measured in miles/kms/minutes 
* Optional: enter city/location you want to go to? 
* Optional: purpose, food/drink/entertainment/walk? 

__API process__
* From each person’s starting point (and if they specified finish location preference):
    * Use triangulation to calculate the literal equidistant locations
        * Different methods of triangulation to give several 
    * Use Google Maps or something to choose “interesting” locations or places, aligned to the optional purpose chosen
    * Use journey length to calculate a radius and then check for overlap, and go from there.
    * 

__Getting started__
- maybe try this with basic co-ordinates first and see how it works? 
    - Triangulation methods
        - Is triangulation the right word? Trilateration in satellites? 
        - Centroid of the triangle
            - Measure the length of each side of the triangle made up by the locations, then find the halfway point of each side. Draw a line from each midpoint to the vertex/interior angle directly opposite that point. Gives the intersect.
            - Voronoi diagram — the intersecting point of the three partitions gives the centre — only takes into account euclidean distance. 
            - Philosophical problem of drawing lines on maps when the earth is round :) 
    - Radius methods 
    - Manual coordinates:
        - Get coordinates of each point, add the latitudes of each and divide by x (where x is number of users). Add the longitudes of each and divide by x. Gives the exact latitude and longitude of the midpoint. Can enter this into google maps. 
    - 
- Meetways.com
- a.placebetween.us
