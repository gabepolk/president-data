function flesch_kincaid(presidentStats) {
  var xDomain = [1785, d3.max(presidentStats, function(d) {return d.date;}) + 10],
      yDomain = [d3.min(presidentStats, function(d) {return d.flesch_kincaid_level;})-2, d3.max(presidentStats, function(d) {return d.flesch_kincaid_level;})+2];

  var margin = {top: 20, right: 20, bottom: 30, left: 40},
      width = 960 - margin.left - margin.right,
      height = 500 - margin.top - margin.bottom;

  // setup x
  var xScale = d3.scale.linear().range([0, width]).domain(xDomain), // value -> display
      xAxis = d3.svg.axis().scale(xScale).tickFormat(d3.format("d")).orient("bottom");

  // setup y
  var yScale = d3.scale.linear().range([height, 0]).domain(yDomain), // value -> display
      yAxis = d3.svg.axis().scale(yScale).orient("left");

  // add the graph canvas to the body of the webpage
  var svg = d3.select("body").append("svg")
      .attr("width", width + margin.left + margin.right)
      .attr("height", height + margin.top + margin.bottom)
    .append("g")
      .attr("transform", "translate(" + margin.left + "," + margin.top + ")");

  //Setup the tooltips when you hover over a circle
  var tooltip = d3.select("body").append("div")
      .attr("class", "tooltip")
      .style("opacity", 0);

  // x-axis
  svg.append("g")
    .attr("class", "x axis")
    .attr("transform", "translate(" + 1.5 + "," + (height-1.5) + ")")
    .call(xAxis)
  .append("text")
    .attr("class", "label")
    .attr("x", width/2)
    .attr("y", margin.bottom)
    .style("text-anchor", "end")
    .text("Year");

  // y-axis
  svg.append("g")
    .attr("class", "y axis")
    .call(yAxis)
  .append("text")
    .attr("class", "label")
    .attr("transform", "rotate(-90)")
    .attr("y", -margin.bottom)
    .attr("x", -height/2+margin.bottom)
    .style("text-anchor", "end")
    .text("Flesch Kincaid Reading Level");

  svg.selectAll(".circle")
    .data(presidentStats)
  .enter()
    .append("circle")
    .attr("r", 10)
    .attr("cx", function(d) {
      return Math.random()*1000;
    })
    .attr("cy", function(d) {
      return Math.random()*750;
    })
    .style("fill", function(d) {
      if(d.party === "Republican")
        return "red";
      else if (d.party === "Democratic")
        return "blue";
      else
        return "green";
    })
    .style("opacity", 0.5)
    .on("mouseover", function(d) {
      tooltip.transition()        
        .duration(200)
        .style("opacity", 0.9);      
      tooltip.html("President " + d.name + "<br/>" + "Approx date of Presidency: " + d.date + "<br/>" +"Grade Level: " + Math.round(d.flesch_kincaid_level) + "<br/>" + "Party: "+ d.party)  
        .style("left", (parseInt(d3.select(this).attr("cx"))+ 5) + "px")
        .style("top", (parseInt(d3.select(this).attr("cy")) - 32) + "px"); 
      })
    .on("mouseout", function(d) {
      tooltip.transition()        
        .duration(200)      
        .style("opacity", 0);
    });

  var circles = d3.selectAll("circle");

    circles.data(presidentStats)
      .transition()
      .duration(750)
      .delay(750)
      .attr("r", 10)
      .attr("cx", function(d) {
        return xScale(d.date);
      })
      .attr("cy", function(d) {
        return yScale(d.flesch_kincaid_level);
      });




}