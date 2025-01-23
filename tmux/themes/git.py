from os import chdir
from argparse import ArgumentParser
from subprocess import Popen
from subprocess import PIPE


def _branch(path):
    chdir(path)
    command = 'git rev-parse --abbrev-ref HEAD'
    process = Popen(command.split(), stdout=PIPE, stderr=PIPE)
    output, _ = process.communicate()
    output = output.decode('UTF-8')
    if output is not None and output != '':
        output = f' {output}'
    return output


def parse_user_args():
    parser = ArgumentParser(prog='Git Branch Parser',
                            description='Return git branch',
                            epilog='Hope it works!')
    parser.add_argument('-p', '--path', required=False,
                        help='path to check for git branch',
                        default='Test')
    return parser.parse_args()


def main():
    args = parse_user_args()
    branch = _branch(args.path)
    print(f'{branch}')


if __name__ == "__main__":
    main()
