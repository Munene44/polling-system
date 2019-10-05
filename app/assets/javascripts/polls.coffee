 submitPoll = (data) ->
      $('#poll-table tbody').append """
      <tr>
          <td>#{data.name}</td>
          <td>#{data.laptop}</td>
          <td><a href="/polls/#{data.id}">Show</a></td>
          <td><a href="/polls/#{data.id}/edit">Edit</a></td>
          <td><a data-confirm="Are you sure?" rel="nofollow" data-method="delete" href="/polls/#{data.id}">Delete</a></td>
      </tr>
      """
      return
    $ ->
    updateChart = (data) ->
      chart = Chartkick.charts['polls'].getChartObject()
      if data.laptop == 'yes'
        chart.data.datasets[0].data[0]++
        chart.update()
      else
        chart.data.datasets[0].data[1]++
        chart.update()

    $ ->
      $('#add_poll').on 'ajax:success', (data) ->
        $('#add_poll')[0].reset()
        return
      pusher = new Pusher('<%= ENV["PUSHER_KEY"] %>',
        cluster: '<%= ENV["PUSHER_CLUSTER"] %>'
        encrypted: true)
      channel = pusher.subscribe('poll')
      channel.bind 'new', (data) ->
          submitPoll data
          updateChart data
          return
      return