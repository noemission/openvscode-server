/*---------------------------------------------------------------------------------------------
 *  Copyright (c) Microsoft Corporation. All rights reserved.
 *  Licensed under the MIT License. See License.txt in the project root for license information.
 *--------------------------------------------------------------------------------------------*/
const { spawn } = require('node:child_process')
const { existsSync, mkdirSync } = require('node:fs')
const { resolve } = require('node:path')

const OUT_DIR = 'final-binaries'

function linux() {

	const build = spawn(
		'docker',
		[
			'build',
			'-f', 'build.Dockerfile',
			'--platform=linux/arm64',
			`--output=${OUT_DIR}`,
			'.'
		],
		{
			stdio: 'inherit'
		}
	)
	build.on('exit', () => console.log('exit'))
	build.on('close', () => console.log('close'))
}

function mac() {

	const build = spawn('./build-me.sh', ['darwin', 'arm64'],
		{
			stdio: 'inherit'
		}
	)
	build.on('exit', () => console.log('exit'))
	build.on('close', () => console.log('close'))
}

if (!existsSync(resolve(__dirname, OUT_DIR))) {
	mkdirSync(resolve(__dirname, OUT_DIR))
}
linux()
// mac()
