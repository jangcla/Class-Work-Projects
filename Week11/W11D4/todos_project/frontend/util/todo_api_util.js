export const fetchTodos = () => (
    $.ajax({
        method: 'GET',
        url: '/api/todos'
    })
);

export const createTodo = () => (
    $.ajax({
        method: 'POST',
        url: '/api/todos'
    })
)