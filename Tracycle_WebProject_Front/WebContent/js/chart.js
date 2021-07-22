
const random = (max = 100) => {
  return Math.round(Math.random() * max) + 20
}

// bar&line chart data
const randomData = () => {
  return [
	  401658, 418214, 429128, 429531, 446102, 497238,
	  401658, 418214, 429128, 429531, 446102, 497238
  ]
}

const months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']

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
