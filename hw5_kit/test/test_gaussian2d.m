function tests = test_gaussian2d
  tests = functiontests(localfunctions);
end


function test_sanity(testCase)
  len = [5,6];
  sigma = {eye(2), [2 1; 1 2]};
  for l=len
    for s=1:length(sigma)
      g = gaussian2d(sigma{s}, l);
      verifyEqual(testCase, size(g), [l,l], ...
                  'Incorrect size.');
      verifyEqual(testCase, sum(g(:)), 1, ...
                  'AbsTol', testCase.TestData.EPS, ...
                  'Filter values must sum to one.');
    end
  end
end


function test_symmetry(testCase)
    g2 = gaussian2d(eye(2), 5);
    verifyEqual(testCase,  g2(3, :), g2(:, 3)', ...
                'AbsTol', testCase.TestData.EPS, ...
                ['When Sigma is identity, central row must be the ' ...
                 'same as central column.']);
end


function test_compare_2d_1d(testCase)
    g1 = gaussian1d(1, 5);
    g2 = gaussian2d(eye(2), 5);
    verifyEqual(testCase, g1, g2(3,:)/sum(g2(3,:)), ...
                'AbsTol', testCase.TestData.EPS, ...
                'Mismatch between 1D and 2D Gaussians.');
    verifyEqual(testCase, g1', g2(:,3)/sum(g2(:,3)), ...
                'AbsTol', testCase.TestData.EPS, ...
                'Mismatch between 1D and 2D Gaussians.');
end


function setupOnce(testCase)
  testCase.TestData.EPS = 1e-6;
end
