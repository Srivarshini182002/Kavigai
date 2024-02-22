from flask import Flask, request, jsonify

app = Flask(__name__)

@app.route('/suggest-services', methods=['POST'])
def handle_request():
    # Check if the request contains JSON data
    if request.headers['Content-Type'] == 'application/json':
        try:
            # Access JSON data from the request body
            data = request.json
            # Process the data as needed
            # ...
            # Return a JSON response
            return jsonify({'message': 'Success'}), 200
        except Exception as e:
            # Handle any errors
            return jsonify({'error': str(e)}), 400
    else:
        # Return error if request does not contain JSON data
        return jsonify({'error': 'Unsupported Media Type'}), 415

if __name__ == '__main__':
    app.run(debug=True)
