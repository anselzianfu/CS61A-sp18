This file holds the tests that you create. Remember to import the python file(s)
you wish to test, along with any other modules you may need.
Run your tests with "python3 ok -t --suite SUITE_NAME --case CASE_NAME -v"
--------------------------------------------------------------------------------

>>> import ants, importlib
>>> importlib.reload(ants)
>>> hive = ants.Hive(ants.AssaultPlan())
>>> dimensions = (2, 9)
>>> colony = ants.AntColony(None, hive, ants.ant_types(),ants.dry_layout, dimensions)
>>> # Adding/Removing QueenAnt with Container
>>> queen = ants.QueenAnt()
>>> impostor = ants.QueenAnt()
>>> container = ants.TankAnt()
>>> colony.places['tunnel_0_3'].add_insect(container)
>>> colony.places['tunnel_0_3'].add_insect(impostor)
>>> impostor.action(colony)
>>> colony.places['tunnel_0_3'].ant is container
True
>>> container.place is colony.places['tunnel_0_3']
True
>>> container.ant is None
True
>>> impostor.place is None
True
>>> colony.places['tunnel_0_3'].add_insect(queen)
>>> colony.places['tunnel_0_3'].remove_insect(queen)
>>> container.ant is queen
True
>>> queen.place is colony.places['tunnel_0_3']
False