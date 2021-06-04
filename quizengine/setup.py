from setuptools import setup

setup(name='quizengine',
      version='0.1',
      description='quiz engine for HackSummer',
      url='http://github.com/mttaggart/hs21-files',
      author='Michael Taggart',
      author_email='mtaggart@taggart-tech.com',
      license='MIT',
      packages=['quizengine'],
      zip_safe=False,
      scripts=["bin/quizengine"]
)
