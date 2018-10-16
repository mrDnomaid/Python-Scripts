const { exec } = require('child_process');
const arg = process.argv[2];


if (arg == '1' || arg == '2') {
	exec('hpacucli ctrl slot=4 pd all show', (err, stdout, stderr) => {
	  if (err) {
	    console.log('ER');
	    return;
	  }

	//console.log(stdout.split('\n'));

	const d1 = stdout.split('\n')[5];
	const d2 = stdout.split('\n')[6];

	  if(d1 && arg == '1') {
		if(d1.includes('OK')) {
			console.log('OK');
		} else {
			console.log('NO');
		}
	  }

	  if(d2 && arg == '2') {
		if(d2.includes('OK')) {
			console.log('OK');
		} else {
			console.log('NO');
		}
  	}
	});
} else if (arg == 'r') {
	exec('hpacucli ctrl slot=4 ld all show', (err, stdout, stderr) => {
          if (err) {
            console.log('ER');
            return;
          }

        //console.log(stdout.split('\n'));

        const r = stdout.split('\n')[5];

          if(r && arg == 'r') {
                if(r.includes('OK')) {
                        console.log('OK');
                } else {
                        console.log('NO');
                }
          }
        });
}
