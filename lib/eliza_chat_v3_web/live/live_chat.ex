defmodule ElizaChatV3Web.LiveChat do
  use ElizaChatV3Web,:live_view

  def mount(_params, _session, socket) do
    {:ok, assign(assign(socket, :message, ""), :history, [])}
  end

  def render(assigns) do
    ~H"""
     <img src={~p"/images/logo-no-background.png"} class="h-36 w-full object-cover mx-auto" />



    <form phx-submit="submit" class="form-submit flex flex-row w-full">
      <input type="text" name="s" placeholder="Enter message" class="search-bar mt-2 block w-full rounded-lg text-zinc-900 focus:ring-0 sm:text-sm sm:leading-6 phx-no-feedback:border-zinc-300 phx-no-feedback:focus:border-zinc-400 border-zinc-300 focus:border-zinc-400" />
      <input type="submit" value="Submit" class=" phx-submit-loading:opacity-75 rounded-lg bg-zinc-900 hover:bg-zinc-700 py-2 px-3 text-sm font-semibold leading-6 text-white active:text-white/80 " />
    </form>

     <div class="message-container p-4 rounded-md shadow-md">
      <%= for {label, message} <- Enum.zip(Stream.cycle(["Question", "Answer"]), @history) do %>
        <p><strong><%= label %>:</strong> <%= message %></p>
      <% end %>
    </div>

    """
  end

  def handle_event("submit", %{"s" => s}, socket) do
    history = socket.assigns.history ++ [s]
    case ElizaChatV3.generate_message(s, history) do
      messages when is_list(messages) ->
        history = history ++ messages
        {:noreply, assign(assign(socket, :message, Enum.join(messages, ", ")), :history, history)}
      {:error, reason} ->
        IO.inspect(reason, label: "Error")
        {:noreply, assign(socket, :message, "An error occurred")}
    end
  end
end
