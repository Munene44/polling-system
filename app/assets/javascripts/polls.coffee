  submitPoll = (data) ->
      $('#poll-table tbody').append """
      <tr>
          <td>#{data.name}</td>
          <td>#{data.laptop}</td>
          <td><a href="/polls/#{data.id}">Show</a></td>
          <td><a href="/polls/#{data.id}/edit">Edit</a></td>
          <td><a data-confirm="Are you sure?" rel="nofollow" data-method="delete" href="/polls/#{data.id}">Destroy</a></td>
      </tr>
      """
      return

    $ ->
      $('#add_poll').on 'ajax:success', (data) ->
        $('#add_poll')[0].reset()
        submitPoll data.detail[0]
        return
      return