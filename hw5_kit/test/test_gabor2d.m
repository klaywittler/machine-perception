function tests = test_gabor2d
  tests = functiontests(localfunctions);
end


function test_sanity(testCase)
  sigma = {200*eye(2), [200 100; 100 200]};
  period = [20,30];
  theta = [30,60];
  for p=period
    for s=1:length(sigma)
      for t=theta
        [re, im] = gaborFilter2D(p, t, sigma{s}, 3*p);
        verifyEqual(testCase, size(re), size(im), ...
                    'Both parts must have same size');
        verifyEqual(testCase, size(re), [3*p, 3*p], ...
                    'Incorrect size.');
        verifyEqual(testCase, sum(sqrt(re(:).^2 + im(:).^2)), 1, ...
                    'AbsTol', testCase.TestData.EPS, ...
                    'Bad normalization.');
      end
    end
  end
end


function test_angle_symmetry(testCase)
  sigma = [200 100; 100 200];
  period = 20;
  angles = {[0, 180], [60, 240]};
  for a=1:length(angles)
    [c1, s1] = gaborFilter2D(period, angles{a}(1), sigma, 3*period);
    [c2, s2] = gaborFilter2D(period, angles{a}(2), sigma, 3*period);
    verifyEqual(testCase, c1, c2, ...
                'AbsTol', testCase.TestData.EPS, ...
                ['Real part must be the same for angles 180 deg apart']);
    verifyEqual(testCase, s1, -s2, ...
                'AbsTol', testCase.TestData.EPS, ...
                'Imaginary part must invert sign for angles 180 deg apart');
  end
end


function test_symmetric_gaussian(testCase)
  sigma = [200 0; 0 200];
  period = 20;
  [c1, s1] = gaborFilter2D(period, 0, sigma, 3*period);
  [c2, s2] = gaborFilter2D(period, 90, sigma, 3*period);
  verifyEqual(testCase, rot90(c1), c2, ...
              'AbsTol', testCase.TestData.EPS, ...
              ['With symmetric gaussian, filters must be rotated by theta2-theta1']);
  verifyEqual(testCase, rot90(s1), s2, ...
              'AbsTol', testCase.TestData.EPS, ...
              'With symmetric gaussian, filters must be rotated by theta2-theta1');
end


function setupOnce(testCase)
  testCase.TestData.EPS = 1e-6;
end
