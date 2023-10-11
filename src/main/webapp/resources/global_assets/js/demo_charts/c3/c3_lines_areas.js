/* ------------------------------------------------------------------------------
 *
 *  # C3.js - lines and areas
 *
 *  Demo JS code for c3_lines_areas.html page
 *
 * ---------------------------------------------------------------------------- */


// Setup module
// ------------------------------

var С3LinesAreas = function() {
	

    //
    // Setup module components
    //

    // Chart
    var _linesAreasExamples = function() {
        if (typeof c3 == 'undefined') {
            console.warn('Warning - c3.min.js is not loaded.');
            return;
        }

        // Define charts elements
        var line_chart_element = document.getElementById('c3-line-chart');
        var chart_line_regions_element = document.getElementById('c3-line-regions-chart');
        var chart_line_regions_element2 = document.getElementById('c3-line-regions-chart2');
        var area_chart_element = document.getElementById('c3-area-chart');
        var area_stacked_chart_element = document.getElementById('c3-area-stacked-chart');
        var step_chart_element = document.getElementById('c3-step-chart');
        var sidebarToggle = document.querySelectorAll('.sidebar-control');


        // Line chart
        if(line_chart_element) {

            // Generate chart
            var line_chart = c3.generate({
                bindto: line_chart_element,
                point: { 
                    r: 4   
                },
                size: { height: 400 },
                color: {
                    pattern: ['#2ec7c9','#b6a2de','#5ab1ef']
                },
                data: {
                    columns: [
                        ['data1', 30, 200, 100, 400, 150, 250],
                        ['data2', 50, 20, 10, 40, 15, 25]
                    ],
                    type: 'spline'
                },
                grid: {
                    y: {
                        show: true
                    }
                }
            });

            // Change data
            setTimeout(function () {
                line_chart.load({
                    columns: [
                        ['data1', 230, 190, 300, 500, 300, 400]
                    ]
                });
            }, 3000);
            setTimeout(function () {
                line_chart.load({
                    columns: [
                        ['data3', 130, 150, 200, 300, 200, 100]
                    ]
                });
            }, 6000);
            setTimeout(function () {
                line_chart.unload({
                    ids: 'data1'
                });
            }, 9000);

            // Resize chart on sidebar width change
            if (sidebarToggle) {
                sidebarToggle.forEach(function(togglers) {
                    togglers.addEventListener('click', function() {
                        line_chart.resize();
                    });
                });
            }
        }

        // Line chart with regions
        if(chart_line_regions_element) {
        	var a = ['페이지뷰'];
        	var a2 = ['방문수'];
        	$.ajax({
        		url: '/graph',
        		type:'post',
        		dataType: 'json',
        		success:function(data){
        			$.each(data.list, function(key, value){
        				a.push(value.cnt)
        			})
        			$.each(data.list2, function(key, value){
        				a2.push(value.cnt)
        			})
        			console.log(a)
        			console.log(a2)
        			 var chart_line_regions = c3.generate({
                bindto: chart_line_regions_element,
                size: { height: 350 },
                point: {
                    r: 1
                },
                axis: {
                    x: {
                        type: '시',
                        tick: {
                            format: function(d) {
                                return d + "시";
                            }
                        },
                    },
                    y: {
                        tick: {
                            format: function(d) {
                                return d + "회";
                            }
                        },
                    }
                },
                color: {
                    pattern: ['#66bb6a', '#ffb980']
                },
                data: {
                    columns: [
                        a,
                        a2
                    ]
                },
                grid: {
                    y: {
                        show: true
                    }
                }
            });

            // Resize chart on sidebar width change
            if (sidebarToggle) {
                sidebarToggle.forEach(function(togglers) {
                    togglers.addEventListener('click', function() {
                        chart_line_regions.resize();
                    });
                });
            }
        			
        			
        			
        			
        			
        			
        			
        			
        			
        		}
        	})
           
        }
        // VISITOR 검색엔진의 유입추이
        if(chart_line_regions_element2) {
        	var a = ['페이지뷰'];
        	var b = ['x'];
        	$.ajax({
        		url: '/visitor_api',
        		type:'post',
        		dataType: 'json',
        		success:function(data){
        			$.each(data.serch, function(key, value){
        				a.push(value.cnt)
        			})
        			$.each(data.serch, function(key, value){
        				b.push(value.ave)
        			})
        			
        	
        			var chart_line_regions = c3.generate({
        				bindto: chart_line_regions_element2,
        				size: { height: 350 },
        				point: {
        					r: 1
        				},
        				axis: {
        					x : {
        						type : 'category',
        						
        					},
        					y: {
        						tick: {
        							format: function(d) {
        								return d + "회";
        							}
        						},
        					}
        				},
        				color: {
        					pattern: ['#66bb6a', '#ffb980']
        				},
        				data: {
        					x:'x',
        					
        					columns: [
        					b
        						,
        						a
        						]
        				},
        				grid: {
        					y: {
        						show: true
        					}
        				}
        			});
        			
        			// Resize chart on sidebar width change
        			if (sidebarToggle) {
        				sidebarToggle.forEach(function(togglers) {
        					togglers.addEventListener('click', function() {
        						chart_line_regions.resize();
        					});
        				});
        			}
        			
        			
        			
        			
        			
        			
        			
        			
        			
        		}
        	})
        	
        }

        // Area chart
        if(area_chart_element) {

            // Generate chart
            var area_chart = c3.generate({
                bindto: area_chart_element,
                size: { height: 400 },
                point: {
                    r: 4
                },
                color: {
                    pattern: ['#2ec7c9','#b6a2de']
                },
                data: {
                    columns: [
                        ['data1', 300, 350, 300, 0, 0, 0],
                        ['data2', 130, 100, 140, 200, 150, 50]
                    ],
                    types: {
                        data1: 'area-spline',
                        data2: 'area-spline'
                    }
                },
                grid: {
                    y: {
                        show: true
                    }
                }
            });

            // Resize chart on sidebar width change
            if (sidebarToggle) {
                sidebarToggle.forEach(function(togglers) {
                    togglers.addEventListener('click', function() {
                        area_chart.resize();
                    });
                });
            }
        }

        // Stacked area chart
        if(area_stacked_chart_element) {

            // Generate chart
            var area_stacked_chart = c3.generate({
                bindto: area_stacked_chart_element,
                size: { height: 400 },
                color: {
                    pattern: ['#2ec7c9','#b6a2de']
                },
                point: {
                    r: 4
                },
                data: {
                    columns: [
                        ['data1', 300, 350, 300, 0, 0, 120],
                        ['data2', 130, 100, 140, 200, 150, 50]
                    ],
                    types: {
                        data1: 'area-spline',
                        data2: 'area-spline'
                    },
                    groups: [['data1', 'data2']]
                },
                grid: {
                    y: {
                        show: true
                    }
                }
            });

            // Resize chart on sidebar width change
            if (sidebarToggle) {
                sidebarToggle.forEach(function(togglers) {
                    togglers.addEventListener('click', function() {
                        area_stacked_chart.resize();
                    });
                });
            }
        }

        // Step chart
        if(step_chart_element) {

            // Generate chart
            var step_chart = c3.generate({
                bindto: step_chart_element,
                size: { height: 400 },
                color: {
                    pattern: ['#ffb980', '#66bb6a']
                },
                data: {
                    columns: [
                        ['data1', 300, 350, 300, 0, 0, 100],
                        ['data2', 130, 100, 140, 200, 150, 50]
                    ],
                    types: {
                        data1: 'step',
                        data2: 'area-step'
                    }
                },
                grid: {
                    y: {
                        show: true
                    }
                }
            });

            // Resize chart on sidebar width change
            if (sidebarToggle) {
                sidebarToggle.forEach(function(togglers) {
                    togglers.addEventListener('click', function() {
                        step_chart.resize();
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
            _linesAreasExamples();
        }
    }
}();


// Initialize module
// ------------------------------

document.addEventListener('DOMContentLoaded', function() {
	
    С3LinesAreas.init();
});
