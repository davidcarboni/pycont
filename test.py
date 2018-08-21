import unittest


class KnownValues(unittest.TestCase):

    def test_in_a_container_step(self):
        self.assertEqual(1, 2)


if __name__ == '__main__':
    unittest.main()
