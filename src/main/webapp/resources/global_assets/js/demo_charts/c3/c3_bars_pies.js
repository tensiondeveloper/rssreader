/* ------------------------------------------------------------------------------
 *
 *  # C3.js - bars and pies
 *
 *  Demo JS code for c3_bars_pies.html page
 *
 * ---------------------------------------------------------------------------- */


// Setup module
// ------------------------------

var С3BarsPies = function() {


    //
    // Setup module components
    //

    // Chart
    var _barsPiesExamples = function(direct,breakj,join) {
    
        if (typeof c3 == 'undefined') {
            console.warn('Warning - c3.min.js is not loaded.');
            return;
        }

        // Define charts elements
        var pie_chart_element = document.getElementById('c3-pie-chart');
        var donut_chart_element = document.getElementById('c3-donut-chart');
        var donut_chart_element2 = document.getElementById('c3-donut-chart2');
        var donut_chart_element3 = document.getElementById('c3-donut-chart3');
        var donut_chart_element4 = document.getElementById('c3-donut-chart4');
        var bar_chart_element = document.getElementById('c3-bar-chart');
        var bar_stacked_chart_element = document.getElementById('c3-bar-stacked-chart');
        var combined_chart_element = document.getElementById('c3-combined-chart');
        var scatter_chart_element = document.getElementById('c3-scatter-chart');
        var sidebarToggle = document.querySelectorAll('.sidebar-control');
        var charta_element = document.getElementById('chart');
        var charta_element_2 = document.getElementById('chart-2');
        var charta_element_3 = document.getElementById('chart-3');
        var charta_element_4 = document.getElementById('chart-4');
        var charta_element_5 = document.getElementById('chart-5');
       
        
        
        
        var chart_root = document.getElementById('root-join');
        var chart_engin = document.getElementById('search-engin');
        
        
       
        
        
        
        
       // 유입수 
        if(charta_element) {
        	var chart = c3.generate({
        		 bindto: charta_element,
        	    data: {
        	        columns: [
        	            ['유입수', direct]
        	        ],
        	        type: 'gauge',
        	        onclick: function (d, i) { console.log("onclick", d, i); },
        	        onmouseover: function (d, i) { console.log("onmouseover", d, i); },
        	        onmouseout: function (d, i) { console.log("onmouseout", d, i); }
        	    },
        	    gauge: {
        	        label: {
        	            format: function(value, ratio) {
        	                return value;
        	            },
        	            show: true // to turn off the min/max labels.
        	        },
        	        min: 0, 
        	        max: join,
        	        //units: '%'// 0 is default, //can handle negative min e.g. vacuum / voltage / current flow / rate of change
//        	    max: 100, // 100 is default
//        	    units: ' %',
//        	    width: 39 // for adjusting arc thickness
        	    },
        	    color: {
        	        pattern: ['#F6C6004', '#F97600', '#F6C600', '#FF0000'], // the three color levels for the percentage values.
        	        threshold: {
        	         /*   unit: 'value', 
        	            max: 200,*/
        	            values: [30, 60, 90, 100]
        	        }
        	    },
        	    size: {
        	        height: 120
        	    }
        	});
        }
	   if(charta_element_2) {
        	var chart_2 = c3.generate({
        		 bindto: charta_element_2,
        		data: {
        			columns: [
        				['전환수', 1]
        				],
        				type: 'gauge',
        				onclick: function (d, i) { console.log("onclick", d, i); },
        				onmouseover: function (d, i) { console.log("onmouseover", d, i); },
        				onmouseout: function (d, i) { console.log("onmouseout", d, i); }
        		},
        		gauge: {
        			label: {
        				format: function(value, ratio) {
        					return value;
        				},
        				show: true // to turn off the min/max labels.
        			},
        			min: 0, // 0 is default, //can handle negative min e.g. vacuum / voltage / current flow / rate of change
//        	    max: 100, // 100 is default
//        	    units: ' %',
//        	    width: 39 // for adjusting arc thickness
        		},
        		color: {
        			pattern: ['#F6C6004', '#F97600', '#F6C600', '#FF0000'], // the three color levels for the percentage values.
        			threshold: {
//        	            unit: 'value', // percentage is default
//        	            max: 200, // 100 is default
        				values: [30, 60, 80, 100]
        			}
        		},
        		size: {
        			height: 120
        		}
        	});
        	
	   }
	   if(charta_element_3) {
		   var chart_3 = c3.generate({
			   bindto: charta_element_3,
			   data: {
				   columns: [
					   ['전환율', 1]
					   ],
					   type: 'gauge',
					   onclick: function (d, i) { console.log("onclick", d, i); },
					   onmouseover: function (d, i) { console.log("onmouseover", d, i); },
					   onmouseout: function (d, i) { console.log("onmouseout", d, i); }
			   },
			   gauge: {
				   label: {
					   format: function(value, ratio) {
						   return value;
					   },
					   show: true // to turn off the min/max labels.
				   },
				   min: 0, // 0 is default, //can handle negative min e.g. vacuum / voltage / current flow / rate of change
//        	    max: 100, // 100 is default
//        	    units: ' %',
//        	    width: 39 // for adjusting arc thickness
			   },
			   color: {
				   pattern: ['#F6C6004', '#F97600', '#F6C600', '#FF0000'], // the three color levels for the percentage values.
				   threshold: {
//        	            unit: 'value', // percentage is default
//        	            max: 200, // 100 is default
					   values: [30, 60, 80, 100]
				   }
			   },
			   size: {
				   height: 120
			   }
		   });
		   
	   }
	   if(charta_element_4) {
		   var chart_4 = c3.generate({
			   bindto: charta_element_4,
			   data: {
				   columns: [
					   ['반송수', breakj]
					   ],
					   type: 'gauge',
					   onclick: function (d, i) { console.log("onclick", d, i); },
					   onmouseover: function (d, i) { console.log("onmouseover", d, i); },
					   onmouseout: function (d, i) { console.log("onmouseout", d, i); }
			   },
			   gauge: {
				   label: {
					   format: function(value, ratio) {
						   return value;
					   },
					   show: true // to turn off the min/max labels.
				   },
				   min: 0, // 0 is default, //can handle negative min e.g. vacuum / voltage / current flow / rate of change
				   max: direct
//        	    max: 100, // 100 is default
//        	    units: ' %',
//        	    width: 39 // for adjusting arc thickness
			   },
			   color: {
				   pattern: ['#F6C6004', '#F97600', '#F6C600', '#FF0000'], // the three color levels for the percentage values.
				   threshold: {
//        	            unit: 'value', // percentage is default
//        	            max: 200, // 100 is default
					   values: [30, 60, 80, 100]
				   }
			   },
			   size: {
				   height: 120
			   }
		   });
		   
	   }
	   if(charta_element_5) {
		   var chart_5 = c3.generate({
			   bindto: charta_element_5,
			   data: {
				   columns: [
					   ['반송률', Math.round(breakj/direct*100)]
					   ],
					   type: 'gauge',
					   onclick: function (d, i) { console.log("onclick", d, i); },
					   onmouseover: function (d, i) { console.log("onmouseover", d, i); },
					   onmouseout: function (d, i) { console.log("onmouseout", d, i); }
			   },
			   gauge: {
				   label: {
					   format: function(value, ratio) {
						   return value;
					   },
					   show: true // to turn off the min/max labels.
				   },
				   min: 0, // 0 is default, //can handle negative min e.g. vacuum / voltage / current flow / rate of change
				   max: 100
//        	    max: 100, // 100 is default
//        	    units: ' %',
//        	    width: 39 // for adjusting arc thickness
			   },
			   color: {
				   pattern: ['#F6C6004', '#F97600', '#F6C600', '#FF0000'], // the three color levels for the percentage values.
				   threshold: {
//        	            unit: 'value', // percentage is default
//        	            max: 200, // 100 is default
					   values: [30, 60, 80, 100]
				   }
			   },
			   size: {
				   height: 120
			   }
		   });
		   
	   }
        	
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        

        // Pie chart
        if(pie_chart_element) {

            // Generate chart
            var pie_chart = c3.generate({
                bindto: pie_chart_element,
                size: { width: 350 },
                color: {
                    pattern: ['#2ec7c9','#b6a2de','#5ab1ef','#ffb980','#d87a80']
                },
                data: {
                    columns: [
                        ['data1', 30],
                        ['data2', 120],
                    ],
                    type : 'pie'
                }
            });

            // Change data
            setTimeout(function () {
                pie_chart.load({
                    columns: [
                        ["setosa", 0.2, 0.2, 0.2, 0.2, 0.2, 0.4, 0.3, 0.2, 0.2, 0.1, 0.2, 0.2, 0.1, 0.1, 0.2, 0.4, 0.4, 0.3, 0.3, 0.3, 0.2, 0.4, 0.2, 0.5, 0.2, 0.2, 0.4, 0.2, 0.2, 0.2, 0.2, 0.4, 0.1, 0.2, 0.2, 0.2, 0.2, 0.1, 0.2, 0.2, 0.3, 0.3, 0.2, 0.6, 0.4, 0.3, 0.2, 0.2, 0.2, 0.2],
                        ["versicolor", 1.4, 1.5, 1.5, 1.3, 1.5, 1.3, 1.6, 1.0, 1.3, 1.4, 1.0, 1.5, 1.0, 1.4, 1.3, 1.4, 1.5, 1.0, 1.5, 1.1, 1.8, 1.3, 1.5, 1.2, 1.3, 1.4, 1.4, 1.7, 1.5, 1.0, 1.1, 1.0, 1.2, 1.6, 1.5, 1.6, 1.5, 1.3, 1.3, 1.3, 1.2, 1.4, 1.2, 1.0, 1.3, 1.2, 1.3, 1.3, 1.1, 1.3],
                        ["virginica", 2.5, 1.9, 2.1, 1.8, 2.2, 2.1, 1.7, 1.8, 1.8, 2.5, 2.0, 1.9, 2.1, 2.0, 2.4, 2.3, 1.8, 2.2, 2.3, 1.5, 2.3, 2.0, 2.0, 1.8, 2.1, 1.8, 1.8, 1.8, 2.1, 1.6, 1.9, 2.0, 2.2, 1.5, 1.4, 2.3, 2.4, 1.8, 1.8, 2.1, 2.4, 2.3, 1.9, 2.3, 2.5, 2.3, 1.9, 2.0, 2.3, 1.8],
                    ]
                });
            }, 4000);
            setTimeout(function () {
                pie_chart.unload({
                    ids: 'data1'
                });
                pie_chart.unload({
                    ids: 'data2'
                });
            }, 8000);

            // Resize chart on sidebar width change
            if (sidebarToggle) {
                sidebarToggle.forEach(function(togglers) {
                    togglers.addEventListener('click', function() {
                        pie_chart.resize();
                    });
                });
            }
        }

        
        
        
        
        if(chart_root) {
        	
        	
        	$.ajax({
        		url: '/come_tb',
        		type:'post',
        		dataType: 'json',
        		success:function(data){
        			var total = 0;
        			var totala = 0;
        			var a = {};
        			$.each(data.tb1, function(key, value){
        				if(value.NAME == '전체'){
        					total = value.cnt;
        				}else{
        					totala += value.cnt;
        				}
        				a[value.NAME+' '+value.cnt] = value.cnt;
        			})
        			totala = total-totala
        			a['기타 '+totala] = totala;
        			var donut_chart = c3.generate({
                      bindto: chart_root,
                      size: { width: 250,height:250 },
                      color: {
                          pattern: ['#2ec7c9','#b6a2de','#5ab1ef','#ffb980','#d87a80']
                      },
                      data: {
                          json: [a],
                          keys: {
                            value: Object.keys(a),
                          },
                          type: "donut",
                      },
                      donut: {
                          title: total
                      }
                  });
        		}
        	})
        }
        
        
        
        
        
        
        if(chart_engin) {
        	
        	var total = 0;
        	$.ajax({
        		url: '/come_tb',
        		type:'post',
        		dataType: 'json',
        		success:function(data){
        			var total = 0;
        			var a = {};
        			$.each(data.tb2, function(key, value){
        				a[value.NAME+' '+value.cnt] = value.cnt;
        				total+= value.cnt;
        			})
        			var donut_chart = c3.generate({
        				bindto: chart_engin,
        				size: { width: 250,height:250 },
        				color: {
        					pattern: ['#2ec7c9','#b6a2de','#5ab1ef','#ffb980','#d87a80']
        				},
        				data: {
        					json: [a],
        					keys: {
        						value: Object.keys(a),
        					},
        					type: "donut",
        				},
        				donut: {
        					title: total
        				}
        			});
        		}
        	})
        }
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        // Donut chart
        if(donut_chart_element) {
        	var a = {};
        	var total = 0;
        	$.ajax({
        		url: '/platform_api',
        		type:'post',
        		dataType: 'json',
        		success:function(data){
        			
        			
        			$.each(data.list, function(key, value){
        				a[value.device_name+' '+value.cnt] = value.cnt;
        				total+= value.cnt;
        			})
                  // Generate chart
        			var donut_chart = c3.generate({
                      bindto: donut_chart_element,
                      size: { width: 350,height:350 },
                      color: {
                          pattern: ['#2ec7c9','#b6a2de','#5ab1ef','#ffb980','#d87a80']
                      },
                      data: {
                          json: [a],
                          keys: {
                            value: Object.keys(a),
                          },
                          type: "donut",
                      },
                      donut: {
                          title: total
                      }
                  });
        		}
        	})
        	
        	
        	
        	

            // Change data
            /*setTimeout(function () {
                donut_chart.load({
                    columns: [
                        ["setosa", 0.2, 0.2, 0.2, 0.2, 0.2, 0.4, 0.3, 0.2, 0.2, 0.1, 0.2, 0.2, 0.1, 0.1, 0.2, 0.4, 0.4, 0.3, 0.3, 0.3, 0.2, 0.4, 0.2, 0.5, 0.2, 0.2, 0.4, 0.2, 0.2, 0.2, 0.2, 0.4, 0.1, 0.2, 0.2, 0.2, 0.2, 0.1, 0.2, 0.2, 0.3, 0.3, 0.2, 0.6, 0.4, 0.3, 0.2, 0.2, 0.2, 0.2],
                        ["versicolor", 1.4, 1.5, 1.5, 1.3, 1.5, 1.3, 1.6, 1.0, 1.3, 1.4, 1.0, 1.5, 1.0, 1.4, 1.3, 1.4, 1.5, 1.0, 1.5, 1.1, 1.8, 1.3, 1.5, 1.2, 1.3, 1.4, 1.4, 1.7, 1.5, 1.0, 1.1, 1.0, 1.2, 1.6, 1.5, 1.6, 1.5, 1.3, 1.3, 1.3, 1.2, 1.4, 1.2, 1.0, 1.3, 1.2, 1.3, 1.3, 1.1, 1.3],
                        ["virginica", 2.5, 1.9, 2.1, 1.8, 2.2, 2.1, 1.7, 1.8, 1.8, 2.5, 2.0, 1.9, 2.1, 2.0, 2.4, 2.3, 1.8, 2.2, 2.3, 1.5, 2.3, 2.0, 2.0, 1.8, 2.1, 1.8, 1.8, 1.8, 2.1, 1.6, 1.9, 2.0, 2.2, 1.5, 1.4, 2.3, 2.4, 1.8, 1.8, 2.1, 2.4, 2.3, 1.9, 2.3, 2.5, 2.3, 1.9, 2.0, 2.3, 1.8],
                    ]
                });
            }, 1000);
            setTimeout(function () {
                donut_chart.unload({
                    ids: 'data1'
                });
                donut_chart.unload({
                    ids: 'data2'
                });
            }, 8000);*/

            // Resize chart on sidebar width change
          /*  if (sidebarToggle) {
                sidebarToggle.forEach(function(togglers) {
                    togglers.addEventListener('click', function() {
                        donut_chart.resize();
                    });
                });
            }*/
        }
        // Donut chart2 visitor
        if(donut_chart_element2) {
        	var a = {};
        	var total = 0;
        	$.ajax({
        		url: '/visitor_api',
        		type:'post',
        		dataType: 'json',
        		success:function(data){
        			$.each(data.comeroot, function(key, value){
        				a[value.NAME+' '+value.cnt] = value.cnt;
        				total+= value.cnt;
        			})
        			// Generate chart
        			var donut_chart = c3.generate({
        				bindto: donut_chart_element2,
        				size: { width: 350,height:350 },
        				color: {
        					pattern: ['#2ec7c9','#b6a2de','#5ab1ef','#ffb980','#d87a80']
        				},
        				data: {
        					json: [a],
        					keys: {
        						value: Object.keys(a),
        					},
        					type: "donut",
        				},
        				donut: {
        					title: total
        				}
        			});
        		}
        	})
        	
        	
        	
        	
        	
        	// Change data
        	/*setTimeout(function () {
                donut_chart.load({
                    columns: [
                        ["setosa", 0.2, 0.2, 0.2, 0.2, 0.2, 0.4, 0.3, 0.2, 0.2, 0.1, 0.2, 0.2, 0.1, 0.1, 0.2, 0.4, 0.4, 0.3, 0.3, 0.3, 0.2, 0.4, 0.2, 0.5, 0.2, 0.2, 0.4, 0.2, 0.2, 0.2, 0.2, 0.4, 0.1, 0.2, 0.2, 0.2, 0.2, 0.1, 0.2, 0.2, 0.3, 0.3, 0.2, 0.6, 0.4, 0.3, 0.2, 0.2, 0.2, 0.2],
                        ["versicolor", 1.4, 1.5, 1.5, 1.3, 1.5, 1.3, 1.6, 1.0, 1.3, 1.4, 1.0, 1.5, 1.0, 1.4, 1.3, 1.4, 1.5, 1.0, 1.5, 1.1, 1.8, 1.3, 1.5, 1.2, 1.3, 1.4, 1.4, 1.7, 1.5, 1.0, 1.1, 1.0, 1.2, 1.6, 1.5, 1.6, 1.5, 1.3, 1.3, 1.3, 1.2, 1.4, 1.2, 1.0, 1.3, 1.2, 1.3, 1.3, 1.1, 1.3],
                        ["virginica", 2.5, 1.9, 2.1, 1.8, 2.2, 2.1, 1.7, 1.8, 1.8, 2.5, 2.0, 1.9, 2.1, 2.0, 2.4, 2.3, 1.8, 2.2, 2.3, 1.5, 2.3, 2.0, 2.0, 1.8, 2.1, 1.8, 1.8, 1.8, 2.1, 1.6, 1.9, 2.0, 2.2, 1.5, 1.4, 2.3, 2.4, 1.8, 1.8, 2.1, 2.4, 2.3, 1.9, 2.3, 2.5, 2.3, 1.9, 2.0, 2.3, 1.8],
                    ]
                });
            }, 1000);
            setTimeout(function () {
                donut_chart.unload({
                    ids: 'data1'
                });
                donut_chart.unload({
                    ids: 'data2'
                });
            }, 8000);*/
        	
        	// Resize chart on sidebar width change
        	/*  if (sidebarToggle) {
                sidebarToggle.forEach(function(togglers) {
                    togglers.addEventListener('click', function() {
                        donut_chart.resize();
                    });
                });
            }*/
        }
        if(donut_chart_element3) {
        	var a = {};
        	var total = 0;
        	$.ajax({
        		url: '/search_api',
        		type:'post',
        		dataType: 'json',
        		success:function(data){
        			$.each(data.engin, function(key, value){
        				console.log(value.NAME)
        				console.log(value.cnt)
        				a[value.NAME+' '+value.cnt] = value.cnt;
        				total+= value.cnt;
        			})
        			// Generate chart
        			var donut_chart = c3.generate({
        				bindto: donut_chart_element3,
        				size: { width: 350,height:350 },
        				color: {
        					pattern: ['#2ec7c9','#b6a2de','#5ab1ef','#ffb980','#d87a80']
        				},
        				data: {
        					json: [a],
        					keys: {
        						value: Object.keys(a),
        					},
        					type: "donut",
        				},
        				donut: {
        					title: total
        				}
        			});
        		}
        	})
        	
        }
        if(donut_chart_element4) {
        	var b = {};
        	var total1 = 0;
        	$.ajax({
        		url: '/search_api',
        		type:'post',
        		dataType: 'json',
        		success:function(data){
        			$.each(data.ref, function(key, value){
        				b[value.ref+' '+value.cnt] = value.cnt;
        				total1+= value.cnt;
        			})
        			// Generate chart
        			var donut_chart = c3.generate({
        				bindto: donut_chart_element4,
        				size: { width: 350,height:350 },
        				color: {
        					pattern: ['#2ec7c9','#b6a2de','#5ab1ef','#ffb980','#d87a80']
        				},
        				data: {
        					json: [b],
        					keys: {
        						value: Object.keys(b),
        					},
        					type: "donut",
        				},
        				donut: {
        					title: total1
        				}
        			});
        		}
        	})
        	
        	
        	
        	
        	
        	// Change data
        	/*setTimeout(function () {
                donut_chart.load({
                    columns: [
                        ["setosa", 0.2, 0.2, 0.2, 0.2, 0.2, 0.4, 0.3, 0.2, 0.2, 0.1, 0.2, 0.2, 0.1, 0.1, 0.2, 0.4, 0.4, 0.3, 0.3, 0.3, 0.2, 0.4, 0.2, 0.5, 0.2, 0.2, 0.4, 0.2, 0.2, 0.2, 0.2, 0.4, 0.1, 0.2, 0.2, 0.2, 0.2, 0.1, 0.2, 0.2, 0.3, 0.3, 0.2, 0.6, 0.4, 0.3, 0.2, 0.2, 0.2, 0.2],
                        ["versicolor", 1.4, 1.5, 1.5, 1.3, 1.5, 1.3, 1.6, 1.0, 1.3, 1.4, 1.0, 1.5, 1.0, 1.4, 1.3, 1.4, 1.5, 1.0, 1.5, 1.1, 1.8, 1.3, 1.5, 1.2, 1.3, 1.4, 1.4, 1.7, 1.5, 1.0, 1.1, 1.0, 1.2, 1.6, 1.5, 1.6, 1.5, 1.3, 1.3, 1.3, 1.2, 1.4, 1.2, 1.0, 1.3, 1.2, 1.3, 1.3, 1.1, 1.3],
                        ["virginica", 2.5, 1.9, 2.1, 1.8, 2.2, 2.1, 1.7, 1.8, 1.8, 2.5, 2.0, 1.9, 2.1, 2.0, 2.4, 2.3, 1.8, 2.2, 2.3, 1.5, 2.3, 2.0, 2.0, 1.8, 2.1, 1.8, 1.8, 1.8, 2.1, 1.6, 1.9, 2.0, 2.2, 1.5, 1.4, 2.3, 2.4, 1.8, 1.8, 2.1, 2.4, 2.3, 1.9, 2.3, 2.5, 2.3, 1.9, 2.0, 2.3, 1.8],
                    ]
                });
            }, 1000);
            setTimeout(function () {
                donut_chart.unload({
                    ids: 'data1'
                });
                donut_chart.unload({
                    ids: 'data2'
                });
            }, 8000);*/
        	
        	// Resize chart on sidebar width change
        	/*  if (sidebarToggle) {
                sidebarToggle.forEach(function(togglers) {
                    togglers.addEventListener('click', function() {
                        donut_chart.resize();
                    });
                });
            }*/
        }
        if(donut_chart_element2) {
        	var a = {};
        	var total = 0;
        	$.ajax({
        		url: '/visitor_api',
        		type:'post',
        		dataType: 'json',
        		success:function(data){
        			$.each(data.comeroot, function(key, value){
        				a[value.NAME+' '+value.cnt] = value.cnt;
        				total+= value.cnt;
        			})
        			// Generate chart
        			var donut_chart = c3.generate({
        				bindto: donut_chart_element2,
        				size: { width: 350,height:350 },
        				color: {
        					pattern: ['#2ec7c9','#b6a2de','#5ab1ef','#ffb980','#d87a80']
        				},
        				data: {
        					json: [a],
        					keys: {
        						value: Object.keys(a),
        					},
        					type: "donut",
        				},
        				donut: {
        					title: total
        				}
        			});
        		}
        	})
        	
        	
        	
        	
        	
        	// Change data
        	/*setTimeout(function () {
                donut_chart.load({
                    columns: [
                        ["setosa", 0.2, 0.2, 0.2, 0.2, 0.2, 0.4, 0.3, 0.2, 0.2, 0.1, 0.2, 0.2, 0.1, 0.1, 0.2, 0.4, 0.4, 0.3, 0.3, 0.3, 0.2, 0.4, 0.2, 0.5, 0.2, 0.2, 0.4, 0.2, 0.2, 0.2, 0.2, 0.4, 0.1, 0.2, 0.2, 0.2, 0.2, 0.1, 0.2, 0.2, 0.3, 0.3, 0.2, 0.6, 0.4, 0.3, 0.2, 0.2, 0.2, 0.2],
                        ["versicolor", 1.4, 1.5, 1.5, 1.3, 1.5, 1.3, 1.6, 1.0, 1.3, 1.4, 1.0, 1.5, 1.0, 1.4, 1.3, 1.4, 1.5, 1.0, 1.5, 1.1, 1.8, 1.3, 1.5, 1.2, 1.3, 1.4, 1.4, 1.7, 1.5, 1.0, 1.1, 1.0, 1.2, 1.6, 1.5, 1.6, 1.5, 1.3, 1.3, 1.3, 1.2, 1.4, 1.2, 1.0, 1.3, 1.2, 1.3, 1.3, 1.1, 1.3],
                        ["virginica", 2.5, 1.9, 2.1, 1.8, 2.2, 2.1, 1.7, 1.8, 1.8, 2.5, 2.0, 1.9, 2.1, 2.0, 2.4, 2.3, 1.8, 2.2, 2.3, 1.5, 2.3, 2.0, 2.0, 1.8, 2.1, 1.8, 1.8, 1.8, 2.1, 1.6, 1.9, 2.0, 2.2, 1.5, 1.4, 2.3, 2.4, 1.8, 1.8, 2.1, 2.4, 2.3, 1.9, 2.3, 2.5, 2.3, 1.9, 2.0, 2.3, 1.8],
                    ]
                });
            }, 1000);
            setTimeout(function () {
                donut_chart.unload({
                    ids: 'data1'
                });
                donut_chart.unload({
                    ids: 'data2'
                });
            }, 8000);*/
        	
        	// Resize chart on sidebar width change
        	/*  if (sidebarToggle) {
                sidebarToggle.forEach(function(togglers) {
                    togglers.addEventListener('click', function() {
                        donut_chart.resize();
                    });
                });
            }*/
        }

        // Bar chart
        if(bar_chart_element) {

            // Generate chart
            var bar_chart = c3.generate({
                bindto: bar_chart_element,
                size: { height: 400 },
                data: {
                    columns: [
                        ['data1', 30, 200, 100, 400, 150, 250],
                        ['data2', 130, 100, 140, 200, 150, 50]
                    ],
                    type: 'bar'
                },
                color: {
                    pattern: ['#66bb6a','#ffb980','#2ec7c9']
                },
                bar: {
                    width: {
                        ratio: 0.5
                    }
                },
                grid: {
                    y: {
                        show: true
                    }
                }
            });

            // Change data
            setTimeout(function () {
                bar_chart.load({
                    columns: [
                        ['data3', 130, -150, 200, 300, -200, 100]
                    ]
                });
            }, 6000);

            // Resize chart on sidebar width change
            if (sidebarToggle) {
                sidebarToggle.forEach(function(togglers) {
                    togglers.addEventListener('click', function() {
                        bar_chart.resize();
                    });
                });
            }
        }

        // Stacked bar chart
        if(bar_stacked_chart_element) {

            // Generate chart
            var bar_stacked_chart = c3.generate({
                bindto: bar_stacked_chart_element,
                size: { height: 400 },
                color: {
                    pattern: ['#66bb6a','#42a5f5','#d87a80','#ffb980']
                },
                data: {
                    columns: [
                        ['data1', -30, 200, 200, 400, -150, 250],
                        ['data2', 130, 100, -100, 200, -150, 50],
                        ['data3', -230, 200, 200, -300, 250, 250]
                    ],
                    type: 'bar',
                    groups: [
                        ['data1', 'data2']
                    ]
                },
                grid: {
                    x: {
                        show: true
                    },
                    y: {
                        lines: [{value:0}]
                    }
                }
            });

            // Change data
            setTimeout(function () {
                bar_stacked_chart.groups([['data1', 'data2', 'data3']])
            }, 4000);
            setTimeout(function () {
                bar_stacked_chart.load({
                    columns: [['data4', 100, -50, 150, 200, -300, -100]]
                });
            }, 8000);
            setTimeout(function () {
                bar_stacked_chart.groups([['data1', 'data2', 'data3', 'data4']])
            }, 10000);

            // Resize chart on sidebar width change
            if (sidebarToggle) {
                sidebarToggle.forEach(function(togglers) {
                    togglers.addEventListener('click', function() {
                        bar_stacked_chart.resize();
                    });
                });
            }
        }

        // Combined chart
        if(combined_chart_element) {
        	var a = ['페이지뷰'];
        	var b = ['한달평균'];

            // Generate chart
        	 // Generate chart
        	//여기
        	$.ajax({
        		url: '/pageview_api',
        		type:'post',
        		dataType: 'json',
        		success:function(data){
        			$.each(data.pageview, function(key, value){
        				a.push(value.cnt)
        			})
        			$.each(data.week, function(key, value){
        				   b.push(value.Total)
        			})
        			console.log(a)
        			var combined_chart = c3.generate({
		                bindto: combined_chart_element,
		                size: { height: 400 },
		                color: {
		                    pattern: ['#2ec7c9', '#b6a2de', '#5ab1ef', '#ffb980', '#d87a80', '#8d98b3']
		                },
		                data: {
		                    columns: [
		                        a,
		                        b
		                    ],
		                    type: 'bar',
		                    types: {
		                    	'페이지뷰': 'line',
		                    },
		                    groups: [
		                        ['data1','data2']
		                    ]
		                }
		            });
		
		            // Resize chart on sidebar width change
		            if (sidebarToggle) {
		                sidebarToggle.forEach(function(togglers) {
		                    togglers.addEventListener('click', function() {
		                        combined_chart.resize();
		                    });
		                });
		            }
        			
        			
        			
        			
        			
        			
        		}
        	})
        	
            
        }

        // Scatter chart
        if(scatter_chart_element) {

            // Generate chart
            var scatter_chart = c3.generate({
                size: { height: 400 },
                bindto: scatter_chart_element,
                data: {
                    xs: {
                        setosa: 'setosa_x',
                        versicolor: 'versicolor_x',
                    },
                    columns: [
                        ["setosa_x", 3.5, 3.0, 3.2, 3.1, 3.6, 3.9, 3.4, 3.4, 2.9, 3.1, 3.7, 3.4, 3.0, 3.0, 4.0, 4.4, 3.9, 3.5, 3.8, 3.8, 3.4, 3.7, 3.6, 3.3, 3.4, 3.0, 3.4, 3.5, 3.4, 3.2, 3.1, 3.4, 4.1, 4.2, 3.1, 3.2, 3.5, 3.6, 3.0, 3.4, 3.5, 2.3, 3.2, 3.5, 3.8, 3.0, 3.8, 3.2, 3.7, 3.3],
                        ["versicolor_x", 3.2, 3.2, 3.1, 2.3, 2.8, 2.8, 3.3, 2.4, 2.9, 2.7, 2.0, 3.0, 2.2, 2.9, 2.9, 3.1, 3.0, 2.7, 2.2, 2.5, 3.2, 2.8, 2.5, 2.8, 2.9, 3.0, 2.8, 3.0, 2.9, 2.6, 2.4, 2.4, 2.7, 2.7, 3.0, 3.4, 3.1, 2.3, 3.0, 2.5, 2.6, 3.0, 2.6, 2.3, 2.7, 3.0, 2.9, 2.9, 2.5, 2.8],
                        ["setosa", 0.2, 0.2, 0.2, 0.2, 0.2, 0.4, 0.3, 0.2, 0.2, 0.1, 0.2, 0.2, 0.1, 0.1, 0.2, 0.4, 0.4, 0.3, 0.3, 0.3, 0.2, 0.4, 0.2, 0.5, 0.2, 0.2, 0.4, 0.2, 0.2, 0.2, 0.2, 0.4, 0.1, 0.2, 0.2, 0.2, 0.2, 0.1, 0.2, 0.2, 0.3, 0.3, 0.2, 0.6, 0.4, 0.3, 0.2, 0.2, 0.2, 0.2],
                        ["versicolor", 1.4, 1.5, 1.5, 1.3, 1.5, 1.3, 1.6, 1.0, 1.3, 1.4, 1.0, 1.5, 1.0, 1.4, 1.3, 1.4, 1.5, 1.0, 1.5, 1.1, 1.8, 1.3, 1.5, 1.2, 1.3, 1.4, 1.4, 1.7, 1.5, 1.0, 1.1, 1.0, 1.2, 1.6, 1.5, 1.6, 1.5, 1.3, 1.3, 1.3, 1.2, 1.4, 1.2, 1.0, 1.3, 1.2, 1.3, 1.3, 1.1, 1.3],
                    ],
                    type: 'scatter'
                },
                color: {
                    pattern: ['#4CAF50', '#ef534f']
                },
                grid: {
                    y: {
                        show: true
                    }
                },
                point: { r: 5 },
                axis: {
                    x: {
                        label: 'Sepal.Width',
                        tick: {
                            fit: false
                        }
                    },
                    y: {
                        label: 'Petal.Width'
                    }
                }
            });

            // Change data
            setTimeout(function () {
                scatter_chart.load({
                    xs: {
                        virginica: 'virginica_x'
                    },
                    columns: [
                        ["virginica_x", 3.3, 2.7, 3.0, 2.9, 3.0, 3.0, 2.5, 2.9, 2.5, 3.6, 3.2, 2.7, 3.0, 2.5, 2.8, 3.2, 3.0, 3.8, 2.6, 2.2, 3.2, 2.8, 2.8, 2.7, 3.3, 3.2, 2.8, 3.0, 2.8, 3.0, 2.8, 3.8, 2.8, 2.8, 2.6, 3.0, 3.4, 3.1, 3.0, 3.1, 3.1, 3.1, 2.7, 3.2, 3.3, 3.0, 2.5, 3.0, 3.4, 3.0],
                        ["virginica", 2.5, 1.9, 2.1, 1.8, 2.2, 2.1, 1.7, 1.8, 1.8, 2.5, 2.0, 1.9, 2.1, 2.0, 2.4, 2.3, 1.8, 2.2, 2.3, 1.5, 2.3, 2.0, 2.0, 1.8, 2.1, 1.8, 1.8, 1.8, 2.1, 1.6, 1.9, 2.0, 2.2, 1.5, 1.4, 2.3, 2.4, 1.8, 1.8, 2.1, 2.4, 2.3, 1.9, 2.3, 2.5, 2.3, 1.9, 2.0, 2.3, 1.8],
                    ]
                });
            }, 4000);
            setTimeout(function () {
                scatter_chart.unload({
                    ids: 'setosa'
                });
            }, 8000);
            setTimeout(function () {
                scatter_chart.load({
                    columns: [
                        ["virginica", 0.2, 0.2, 0.2, 0.2, 0.2, 0.4, 0.3, 0.2, 0.2, 0.1, 0.2, 0.2, 0.1, 0.1, 0.2, 0.4, 0.4, 0.3, 0.3, 0.3, 0.2, 0.4, 0.2, 0.5, 0.2, 0.2, 0.4, 0.2, 0.2, 0.2, 0.2, 0.4, 0.1, 0.2, 0.2, 0.2, 0.2, 0.1, 0.2, 0.2, 0.3, 0.3, 0.2, 0.6, 0.4, 0.3, 0.2, 0.2, 0.2, 0.2],
                    ]
                });
            }, 10000);

            // Resize chart on sidebar width change
            if (sidebarToggle) {
                sidebarToggle.forEach(function(togglers) {
                    togglers.addEventListener('click', function() {
                        scatter_chart.resize();
                    });
                });
            }
        }
    };


    //
    // Return objects assigned to module
    //

    return {
        init: function() {
      
        	
        	
        	
            
        }
    }
}();


// Initialize module
// ------------------------------

document.addEventListener('DOMContentLoaded', function() {
	
	
	
    С3BarsPies.init();
    
    
    
    
    
    
});
