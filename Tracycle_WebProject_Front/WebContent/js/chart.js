
const random = (max = 100) => {
  return Math.round(Math.random() * max) + 20
}

// bar&line chart data
const randomData = () => {
  return [
	  401658, 418214, 429128, 429531, 446102, 497238

  ]
}



const months = ['2014', '2015', '2016', '2017', '2018', '2019']

const barChart = new Chart(document.getElementById('barChart'), {
  type: 'bar',
  data: {
    labels: months,
    datasets: [
      {
        data: randomData(),
        backgroundColor: ' rgba(128, 156, 168, 1)',
        hoverBackgroundColor: 'gray',
      },
    ],
  },
  options: {
    scales: {
      yAxes: [
        {
          gridLines: false,
          ticks: {
        	 min:300000,
        	 max:500000,
            beginAtZero: true,
            stepSize: 50,
            fontSize: 12,
            fontColor: 'rgba(128, 156, 168, 1)',
            fontFamily: 'Nunito, sans-serif',
            padding: 10,
          },
        },
      ],
      xAxes: [
        {
          gridLines: false,
          ticks: {
            fontSize: 12,
            fontColor: 'rgba(128, 156, 168, 1)',
            fontFamily: 'Nunito, sans-serif',
            padding: 5,
          },
          categoryPercentage: 0.5,
          maxBarThickness: '10',
        },
      ],
    },
    cornerRadius: 2,
    maintainAspectRatio: false,
    legend: {
      display: false,
    },
  },
})

const doughnutChart = new Chart(document.getElementById('doughnutChart'), {
  type: 'doughnut',
  data: {
    labels: ['2018', '2019', '2020'],
    datasets: [
      {
        data: [random(), random(), random()],
        backgroundColor: ' rgba(128, 156, 168, 1)',
        hoverBackgroundColor: 'gray',
        borderWidth: 0,
        weight: 0.5,
      },
    ],
  },
  options: {
    responsive: true,
    maintainAspectRatio: false,
    legend: {
      position: 'bottom',
    },

    title: {
      display: false,
    },
    animation: {
      animateScale: true,
      animateRotate: true,
    },
  },
})

const activeUsersChart = new Chart(document.getElementById('activeUsersChart'), {
  type: 'bar',
  data: {
    labels: [...randomData(), ...randomData()],
    datasets: [
      {
        data: [...randomData(), ...randomData()],
        backgroundColor: ' rgba(128, 156, 168, 1)',
        borderWidth: 0,
        categoryPercentage: 1,
      },
    ],
  },
  options: {
    scales: {
      yAxes: [
        {
          display: false,
          gridLines: false,
        },
      ],
      xAxes: [
        {
          display: false,
          gridLines: false,
        },
      ],
      ticks: {
        padding: 10,
      },
    },
    cornerRadius: 2,
    maintainAspectRatio: false,
    legend: {
      display: false,
    },
    tooltips: {
      prefix: 'Users',
      bodySpacing: 4,
      footerSpacing: 4,
      hasIndicator: true,
      mode: 'index',
      intersect: true,
    },
    hover: {
      mode: 'nearest',
      intersect: true,
    },
  },
})

const lineChart = new Chart(document.getElementById('lineChart'), {
  type: 'line',
  data: {
    labels: months,
    datasets: [
      {
        data: randomData(),
        fill: false,
        borderColor: ' rgba(128, 156, 168, 1)',
        borderWidth: 2,
        pointRadius: 0,
        pointHoverRadius: 0,
      },
    ],
  },
  options: {
    responsive: true,
    scales: {
      yAxes: [
        {
          gridLines: true,
          ticks: {
        	min:400000,
        	max:500000,
            beginAtZero: false,
            stepSize: 50,
            fontSize: 12,
            fontColor: 'rgba(128, 156, 168, 1)',
            fontFamily: 'Nunito, sans-serif',
            padding: 20,
          },
        },
      ],
      xAxes: [
        {
          gridLines: false,
        },
      ],
    },
    maintainAspectRatio: false,
    legend: {
      display: false,
    },
    tooltips: {
      hasIndicator: true,
      intersect: false,
    },
  },
})

let randomUserCount = 0

const usersCount = document.getElementById('usersCount')

const fakeUsersCount = () => {
  randomUserCount = random()
  activeUsersChart.data.datasets[0].data.push(randomUserCount)
  activeUsersChart.data.datasets[0].data.splice(0, 1)
  activeUsersChart.update()
  usersCount.innerText = randomUserCount
}

setInterval(() => {
  fakeUsersCount()
}, 1000)


/*mixed 차트*/
      new Vue({
        el: '#app',
        components: {
          apexchart: VueApexCharts,
        },
        data: {
          
          series: [{
            name: 'Sea Level',
            type: 'area',
            data: [0,
            	0.220472441,
            	-0.440944881,
            	-0.232283464,
            	0.59055118,
            	0.531496062,
            	0.437007874,
            	0.216535433,
            	0.299212598,
            	0.362204724,
            	0.440944881,
            	0.374015748,
            	0.499999999,
            	0.685039369,
            	0.303149606,
            	0.767716535,
            	0.468503937,
            	0.673228346,
            	1.043307086,
            	1.338582676,
            	1.125984251,
            	1.110236219,
            	1.291338581,
            	1.606299211,
            	1.2007874,
            	0.984251968,
            	1.251968503,
            	1.196850392,
            	1.098425196,
            	1.27559055,
            	1.271653542,
            	1.598425195,
            	1.476377951,
            	1.547244093,
            	1.795275589,
            	2.10629921,
            	2.031496061,
            	1.854330707,
            	1.791338581,
            	1.854330707,
            	1.905511809,
            	1.988188974,
            	1.952755904,
            	1.999999998,
            	1.712598423,
            	1.791338581,
            	2.047244092,
            	2.003937006,
            	1.850393699,
            	1.905511809,
            	2.062992124,
            	2.047244092,
            	2.271653541,
            	2.440944879,
            	2.228346454,
            	2.448818895,
            	2.295275588,
            	2.519685037,
            	2.622047241,
            	2.826771651,
            	2.618110234,
            	3.098425194,
            	3.098425194,
            	3.098425194,
            	2.84645669,
            	2.95669291,
            	3.251968501,
            	3.374015745,
            	3.562992122,
            	3.51181102,
            	3.598425193,
            	3.972440941,
            	3.870078736,
            	4.043307082,
            	3.929133854,
            	3.964566925,
            	3.763779524,
            	4.291338578,
            	4.346456688,
            	4.358267712,
            	4.503937003,
            	4.748031491,
            	4.543307082,
            	4.480314956,
            	4.169291334,
            	4.610236216,
            	4.397637791,
            	4.452755901,
            	4.484251964,
            	4.751968499,
            	4.67716535,
            	4.881889759,
            	5.240157475,
            	5.003937003,
            	5.472440939,
            	5.409448813,
            	5.370078735,
            	5.303149601,
            	5.555118105,
            	5.362204719,
            	5.598425191,
            	6.086614167,
            	5.858267711,
            	6.188976372,
            	6.153543301,
            	5.74803149,
            	5.771653537,
            	5.795275585,
            	5.980314955,
            	6.157480309,
            	6.24803149,
            	6.346456686,
            	6.374015742,
            	6.3031496,
            	6.507874009,
            	6.622047237,
            	6.78346456,
            	7.059055111,
            	6.669291332,
            	7.003937001,
            	7.055118103,
            	7.271653536,
            	7.366141725,
            	7.728346449,
            	7.712598417,
            	7.716535425,
            	7.885826764,
            	7.960629913,
            	8.303149598,
            	8.531496054,
            	8.83464566,
            	8.897637786,
            	9.244094479,
            	8.913385818,
            	8.579437488,
            	8.925434863,
            	9.036237302,
            	9.087686066,
            	9.221199845,
            	9.47933086
]
          }, {
            name: 'Temperature',
            type: 'column',
            data: [4.84,
            	4.92,
            	4.9,
            	4.84,
            	4.72,
            	4.67,
            	4.69,
            	4.64,
            	4.83,
            	4.9,
            	4.65,
            	4.78,
            	4.73,
            	4.69,
            	4.7,
            	4.78,
            	4.89,
            	4.9,
            	4.73,
            	4.83,
            	4.92,
            	4.85,
            	4.72,
            	4.63,
            	4.53,
            	4.74,
            	4.78,
            	4.61,
            	4.57,
            	4.52,
            	4.57,
            	4.56,
            	4.64,
            	4.66,
            	4.85,
            	4.86,
            	4.64,
            	4.54,
            	4.7,
            	4.73,
            	4.73,
            	4.81,
            	4.71,
            	4.73,
            	4.73,
            	4.78,
            	4.89,
            	4.78,
            	4.8,
            	4.64,
            	4.84,
            	4.9,
            	4.84,
            	4.71,
            	4.88,
            	4.8,
            	4.85,
            	4.97,
            	5,
            	4.98,
            	5.12,
            	5.18,
            	5.06,
            	5.09,
            	5.2,
            	5.09,
            	4.93,
            	4.97,
            	4.89,
            	4.89,
            	4.83,
            	4.93,
            	5.01,
            	5.08,
            	4.87,
            	4.86,
            	4.81,
            	5.05,
            	5.06,
            	5.03,
            	4.97,
            	5.06,
            	5.03,
            	5.05,
            	4.8,
            	4.89,
            	4.94,
            	4.98,
            	4.92,
            	5.05,
            	5.03,
            	4.92,
            	5.01,
            	5.16,
            	4.93,
            	4.99,
            	4.9,
            	5.18,
            	5.07,
            	5.16,
            	5.26,
            	5.32,
            	5.14,
            	5.31,
            	5.16,
            	5.12,
            	5.18,
            	5.32,
            	5.39,
            	5.27,
            	5.45,
            	5.41,
            	5.22,
            	5.23,
            	5.32,
            	5.45,
            	5.33,
            	5.47,
            	5.61,
            	5.39,
            	5.4,
            	5.54,
            	5.63,
            	5.62,
            	5.54,
            	5.68,
            	5.64,
            	5.66,
            	5.54,
            	5.66,
            	5.72,
            	5.61,
            	5.65,
            	5.68,
            	5.74,
            	5.9,
            	6.01,
            	5.92,
            	5.85,
            	5.98,
            	6.02
]
          }],
          chartOptions: {
            chart: {
              height: 350,
              type: 'line',
              stacked: false,
            },
            stroke: {
              width: [0, 2, 5],
              curve: 'smooth'
            },
            plotOptions: {
              bar: {
                columnWidth: '50%'
              }
            },
            
            fill: {
              opacity: [0.85, 0.25, 1],
              gradient: {
                inverseColors: false,
                shade: 'light',
                type: "vertical",
                opacityFrom: 0.85,
                opacityTo: 0.55,
                stops: [0, 100, 100, 100]
              }
            },
            labels: ["1880",
            	"1881",
            	"1882",
            	"1883",
            	"1884",
            	"1885",
            	"1886",
            	"1887",
            	"1888",
            	"1889",
            	"1890",
            	"1891",
            	"1892",
            	"1893",
            	"1894",
            	"1895",
            	"1896",
            	"1897",
            	"1898",
            	"1899",
            	"1900",
            	"1901",
            	"1902",
            	"1903",
            	"1904",
            	"1905",
            	"1906",
            	"1907",
            	"1908",
            	"1909",
            	"1910",
            	"1911",
            	"1912",
            	"1913",
            	"1914",
            	"1915",
            	"1916",
            	"1917",
            	"1918",
            	"1919",
            	"1920",
            	"1921",
            	"1922",
            	"1923",
            	"1924",
            	"1925",
            	"1926",
            	"1927",
            	"1928",
            	"1929",
            	"1930",
            	"1931",
            	"1932",
            	"1933",
            	"1934",
            	"1935",
            	"1936",
            	"1937",
            	"1938",
            	"1939",
            	"1940",
            	"1941",
            	"1942",
            	"1943",
            	"1944",
            	"1945",
            	"1946",
            	"1947",
            	"1948",
            	"1949",
            	"1950",
            	"1951",
            	"1952",
            	"1953",
            	"1954",
            	"1955",
            	"1956",
            	"1957",
            	"1958",
            	"1959",
            	"1960",
            	"1961",
            	"1962",
            	"1963",
            	"1964",
            	"1965",
            	"1966",
            	"1967",
            	"1968",
            	"1969",
            	"1970",
            	"1971",
            	"1972",
            	"1973",
            	"1974",
            	"1975",
            	"1976",
            	"1977",
            	"1978",
            	"1979",
            	"1980",
            	"1981",
            	"1982",
            	"1983",
            	"1984",
            	"1985",
            	"1986",
            	"1987",
            	"1988",
            	"1989",
            	"1990",
            	"1991",
            	"1992",
            	"1993",
            	"1994",
            	"1995",
            	"1996",
            	"1997",
            	"1998",
            	"1999",
            	"2000",
            	"2001",
            	"2002",
            	"2003",
            	"2004",
            	"2005",
            	"2006",
            	"2007",
            	"2008",
            	"2009",
            	"2010",
            	"2011",
            	"2012",
            	"2013",
            	"2014",
            	"2015",
            	"2016",
            	"2017",
            	"2018",
            	"2019"
            ],
            markers: {
              size: 0
            },
            xaxis: {
              type: 'datetime'
            },
            yaxis: {
              title: {
                text: 'Points',
              },
              min: 0
            },
            tooltip: {
              shared: true,
              intersect: false,
              y: {
                formatter: function (y) {
                  if (typeof y !== "undefined") {
                    return y.toFixed(0) + " points";
                  }
                  return y;
            
                }
              }
            }
          },
          
          
        },
        
      })


new Vue({
    el: '#app1',
    components: {
      apexchart: VueApexCharts,
    },
    data: {
      
      series: [{
        name: 'Metric1',
        data: generateData(18, {
          min: 0,
          max: 90
        })
      },
      {
        name: 'Metric2',
        data: generateData(18, {
          min: 0,
          max: 90
        })
      },
      {
        name: 'Metric3',
        data: generateData(18, {
          min: 0,
          max: 90
        })
      },
      {
        name: 'Metric4',
        data: generateData(18, {
          min: 0,
          max: 90
        })
      },
      {
        name: 'Metric5',
        data: generateData(18, {
          min: 0,
          max: 90
        })
      },
      {
        name: 'Metric6',
        data: generateData(18, {
          min: 0,
          max: 90
        })
      },
      {
        name: 'Metric7',
        data: generateData(18, {
          min: 0,
          max: 90
        })
      },
      {
        name: 'Metric8',
        data: generateData(18, {
          min: 0,
          max: 90
        })
      },
      {
        name: 'Metric9',
        data: generateData(18, {
          min: 0,
          max: 90
        })
      }
      ],
      chartOptions: {
        chart: {
          height: 350,
          type: 'heatmap',
        },
        dataLabels: {
          enabled: false
        },
        colors: ["#008FFB"],
        title: {
          text: 'HeatMap Chart (Single color)'
        },
      },
      
      
    },
    
  })