import requests
import nose.tools as nt

def test_add_api():
    resp = requests.get('http://localhost:8888/add', params={'numa': 1, 'numb': 2})
    print resp.url
    obj = resp.json()
    nt.assert_equal(resp.status_code, 200)
    nt.assert_equal(obj['result'], 3)
