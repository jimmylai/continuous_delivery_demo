from util import add
import nose.tools as nt

def test_add():
    nt.assert_equal(add(1,2), 3)
