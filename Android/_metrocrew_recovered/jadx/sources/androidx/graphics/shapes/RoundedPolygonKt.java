package androidx.graphics.shapes;

import androidx.collection.FloatFloatPair;
import androidx.collection.MutableFloatList;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import kotlin.Metadata;
import kotlin.Pair;
import kotlin.TuplesKt;
import kotlin.collections.CollectionsKt;
import kotlin.collections.IntIterator;
import kotlin.jvm.internal.Intrinsics;
import kotlin.ranges.RangesKt;

/* JADX INFO: compiled from: RoundedPolygon.kt */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u00008\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u0014\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010 \n\u0000\n\u0002\u0010\u0007\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\u001a\u000e\u0010\u0000\u001a\u00020\u00012\u0006\u0010\u0002\u001a\u00020\u0001\u001a@\u0010\u0000\u001a\u00020\u00012\u0006\u0010\u0003\u001a\u00020\u00042\b\b\u0002\u0010\u0005\u001a\u00020\u00062\u0010\b\u0002\u0010\u0007\u001a\n\u0012\u0004\u0012\u00020\u0006\u0018\u00010\b2\b\b\u0002\u0010\t\u001a\u00020\n2\b\b\u0002\u0010\u000b\u001a\u00020\nH\u0007\u001aL\u0010\u0000\u001a\u00020\u00012\b\b\u0001\u0010\f\u001a\u00020\r2\b\b\u0002\u0010\u000e\u001a\u00020\n2\b\b\u0002\u0010\t\u001a\u00020\n2\b\b\u0002\u0010\u000b\u001a\u00020\n2\b\b\u0002\u0010\u0005\u001a\u00020\u00062\u0010\b\u0002\u0010\u0007\u001a\n\u0012\u0004\u0012\u00020\u0006\u0018\u00010\bH\u0007\u001a\u0019\u0010\u000f\u001a\u00060\u0010j\u0002`\u00112\u0006\u0010\u0003\u001a\u00020\u0004H\u0002¢\u0006\u0002\u0010\u0012\u001a(\u0010\u0013\u001a\u00020\u00042\u0006\u0010\f\u001a\u00020\r2\u0006\u0010\u000e\u001a\u00020\n2\u0006\u0010\t\u001a\u00020\n2\u0006\u0010\u000b\u001a\u00020\nH\u0002¨\u0006\u0014"}, d2 = {"RoundedPolygon", "Landroidx/graphics/shapes/RoundedPolygon;", "source", "vertices", "", "rounding", "Landroidx/graphics/shapes/CornerRounding;", "perVertexRounding", "", "centerX", "", "centerY", "numVertices", "", "radius", "calculateCenter", "Landroidx/collection/FloatFloatPair;", "Landroidx/graphics/shapes/Point;", "([F)J", "verticesFromNumVerts", "graphics-shapes_release"}, k = 2, mv = {1, 8, 0}, xi = 48)
public final class RoundedPolygonKt {
    public static final RoundedPolygon RoundedPolygon(int i) {
        return RoundedPolygon$default(i, 0.0f, 0.0f, 0.0f, null, null, 62, null);
    }

    public static final RoundedPolygon RoundedPolygon(int i, float f) {
        return RoundedPolygon$default(i, f, 0.0f, 0.0f, null, null, 60, null);
    }

    public static final RoundedPolygon RoundedPolygon(int i, float f, float f2) {
        return RoundedPolygon$default(i, f, f2, 0.0f, null, null, 56, null);
    }

    public static final RoundedPolygon RoundedPolygon(int i, float f, float f2, float f3) {
        return RoundedPolygon$default(i, f, f2, f3, null, null, 48, null);
    }

    public static final RoundedPolygon RoundedPolygon(int i, float f, float f2, float f3, CornerRounding rounding) {
        Intrinsics.checkNotNullParameter(rounding, "rounding");
        return RoundedPolygon$default(i, f, f2, f3, rounding, null, 32, null);
    }

    public static final RoundedPolygon RoundedPolygon(float[] vertices) {
        Intrinsics.checkNotNullParameter(vertices, "vertices");
        return RoundedPolygon$default(vertices, null, null, 0.0f, 0.0f, 30, null);
    }

    public static final RoundedPolygon RoundedPolygon(float[] vertices, CornerRounding rounding) {
        Intrinsics.checkNotNullParameter(vertices, "vertices");
        Intrinsics.checkNotNullParameter(rounding, "rounding");
        return RoundedPolygon$default(vertices, rounding, null, 0.0f, 0.0f, 28, null);
    }

    public static final RoundedPolygon RoundedPolygon(float[] vertices, CornerRounding rounding, List<CornerRounding> list) {
        Intrinsics.checkNotNullParameter(vertices, "vertices");
        Intrinsics.checkNotNullParameter(rounding, "rounding");
        return RoundedPolygon$default(vertices, rounding, list, 0.0f, 0.0f, 24, null);
    }

    public static final RoundedPolygon RoundedPolygon(float[] vertices, CornerRounding rounding, List<CornerRounding> list, float f) {
        Intrinsics.checkNotNullParameter(vertices, "vertices");
        Intrinsics.checkNotNullParameter(rounding, "rounding");
        return RoundedPolygon$default(vertices, rounding, list, f, 0.0f, 16, null);
    }

    public static /* synthetic */ RoundedPolygon RoundedPolygon$default(int i, float f, float f2, float f3, CornerRounding cornerRounding, List list, int i2, Object obj) {
        if ((i2 & 2) != 0) {
            f = 1.0f;
        }
        if ((i2 & 4) != 0) {
            f2 = 0.0f;
        }
        if ((i2 & 8) != 0) {
            f3 = 0.0f;
        }
        if ((i2 & 16) != 0) {
            cornerRounding = CornerRounding.Unrounded;
        }
        return RoundedPolygon(i, f, f2, f3, cornerRounding, (i2 & 32) != 0 ? null : list);
    }

    public static final RoundedPolygon RoundedPolygon(int numVertices, float radius, float centerX, float centerY, CornerRounding rounding, List<CornerRounding> list) {
        Intrinsics.checkNotNullParameter(rounding, "rounding");
        return RoundedPolygon(verticesFromNumVerts(numVertices, radius, centerX, centerY), rounding, list, centerX, centerY);
    }

    public static final RoundedPolygon RoundedPolygon(RoundedPolygon source) {
        Intrinsics.checkNotNullParameter(source, "source");
        return new RoundedPolygon(source.getFeatures$graphics_shapes_release(), source.getCenterX(), source.getCenterY());
    }

    public static /* synthetic */ RoundedPolygon RoundedPolygon$default(float[] fArr, CornerRounding cornerRounding, List list, float f, float f2, int i, Object obj) {
        if ((i & 2) != 0) {
            cornerRounding = CornerRounding.Unrounded;
        }
        if ((i & 4) != 0) {
            list = null;
        }
        if ((i & 8) != 0) {
            f = Float.MIN_VALUE;
        }
        if ((i & 16) != 0) {
            f2 = Float.MIN_VALUE;
        }
        return RoundedPolygon(fArr, cornerRounding, (List<CornerRounding>) list, f, f2);
    }

    /* JADX WARN: Code duplicated, block: B:51:0x02d4  */
    public static final RoundedPolygon RoundedPolygon(float[] vertices, CornerRounding rounding, List<CornerRounding> list, float centerX, float centerY) {
        long jCalculateCenter;
        Pair pair;
        CornerRounding cornerRounding;
        float[] vertices2 = vertices;
        Intrinsics.checkNotNullParameter(vertices2, "vertices");
        Intrinsics.checkNotNullParameter(rounding, "rounding");
        if (vertices2.length < 6) {
            throw new IllegalArgumentException("Polygons must have at least 3 vertices");
        }
        int i = 2;
        int i2 = 1;
        if (vertices2.length % 2 == 1) {
            throw new IllegalArgumentException("The vertices array should have even size");
        }
        if (list != null && list.size() * 2 != vertices2.length) {
            throw new IllegalArgumentException("perVertexRounding list should be either null or the same size as the number of vertices (vertices.size / 2)");
        }
        List corners = new ArrayList();
        int n = vertices2.length / 2;
        List roundedCorners = new ArrayList();
        int i3 = 0;
        while (i3 < n) {
            if (list == null || (cornerRounding = list.get(i3)) == null) {
                cornerRounding = rounding;
            }
            CornerRounding vtxRounding = cornerRounding;
            int prevIndex = (((i3 + n) - i2) % n) * 2;
            int nextIndex = ((i3 + 1) % n) * 2;
            roundedCorners.add(new RoundedCorner(FloatFloatPair.m10constructorimpl(vertices2[prevIndex], vertices2[prevIndex + 1]), FloatFloatPair.m10constructorimpl(vertices2[i3 * 2], vertices2[(i3 * 2) + i2]), FloatFloatPair.m10constructorimpl(vertices2[nextIndex], vertices2[nextIndex + 1]), vtxRounding, null));
            i3++;
            i2 = i2;
        }
        int i4 = i2;
        Iterable $this$map$iv = RangesKt.until(0, n);
        Collection destination$iv$iv = new ArrayList(CollectionsKt.collectionSizeOrDefault($this$map$iv, 10));
        Iterator<Integer> it = $this$map$iv.iterator();
        while (it.hasNext()) {
            int item$iv$iv = ((IntIterator) it).nextInt();
            float expectedRoundCut = ((RoundedCorner) roundedCorners.get(item$iv$iv)).getExpectedRoundCut() + ((RoundedCorner) roundedCorners.get((item$iv$iv + 1) % n)).getExpectedRoundCut();
            int i5 = i;
            float expectedCut = ((RoundedCorner) roundedCorners.get(item$iv$iv)).getExpectedCut() + ((RoundedCorner) roundedCorners.get((item$iv$iv + 1) % n)).getExpectedCut();
            float vtxX = vertices2[item$iv$iv * 2];
            float vtxY = vertices2[(item$iv$iv * 2) + 1];
            float nextVtxX = vertices2[((item$iv$iv + 1) % n) * 2];
            float nextVtxY = vertices2[(((item$iv$iv + 1) % n) * 2) + 1];
            float sideSize = Utils.distance(vtxX - nextVtxX, vtxY - nextVtxY);
            if (expectedRoundCut > sideSize) {
                pair = TuplesKt.to(Float.valueOf(sideSize / expectedRoundCut), Float.valueOf(0.0f));
            } else if (expectedCut > sideSize) {
                pair = TuplesKt.to(Float.valueOf(1.0f), Float.valueOf((sideSize - expectedRoundCut) / (expectedCut - expectedRoundCut)));
            } else {
                pair = TuplesKt.to(Float.valueOf(1.0f), Float.valueOf(1.0f));
            }
            destination$iv$iv.add(pair);
            vertices2 = vertices;
            i = i5;
        }
        int i6 = i;
        List cutAdjusts = (List) destination$iv$iv;
        int i7 = 0;
        while (i7 < n) {
            int i8 = i6;
            MutableFloatList allowedCuts = new MutableFloatList(i8);
            for (int delta = 0; delta < i8; delta++) {
                Pair pair2 = (Pair) cutAdjusts.get((((i7 + n) - 1) + delta) % n);
                float roundCutRatio = ((Number) pair2.component1()).floatValue();
                float cutRatio = ((Number) pair2.component2()).floatValue();
                allowedCuts.add((((RoundedCorner) roundedCorners.get(i7)).getExpectedRoundCut() * roundCutRatio) + ((((RoundedCorner) roundedCorners.get(i7)).getExpectedCut() - ((RoundedCorner) roundedCorners.get(i7)).getExpectedRoundCut()) * cutRatio));
            }
            corners.add(((RoundedCorner) roundedCorners.get(i7)).getCubics(allowedCuts.get(0), allowedCuts.get(i4)));
            i7++;
            i6 = i8;
            i4 = 1;
        }
        List tempFeatures = new ArrayList();
        int i9 = 0;
        while (i9 < n) {
            int prevVtxIndex = ((i9 + n) - 1) % n;
            int nextVtxIndex = (i9 + 1) % n;
            long currVertex = FloatFloatPair.m10constructorimpl(vertices[i9 * 2], vertices[(i9 * 2) + 1]);
            long prevVertex = FloatFloatPair.m10constructorimpl(vertices[prevVtxIndex * 2], vertices[(prevVtxIndex * 2) + 1]);
            long nextVertex = FloatFloatPair.m10constructorimpl(vertices[nextVtxIndex * 2], vertices[(nextVtxIndex * 2) + 1]);
            int n2 = n;
            boolean convex = PointKt.m90clockwiseybeJwSQ(PointKt.m102minusybeJwSQ(currVertex, prevVertex), PointKt.m102minusybeJwSQ(nextVertex, currVertex));
            tempFeatures.add(new Feature.Corner((List) corners.get(i9), currVertex, ((RoundedCorner) roundedCorners.get(i9)).getCenter(), convex, null));
            tempFeatures.add(new Feature.Edge(CollectionsKt.listOf(Cubic.INSTANCE.straightLine(((Cubic) CollectionsKt.last((List) corners.get(i9))).getAnchor1X(), ((Cubic) CollectionsKt.last((List) corners.get(i9))).getAnchor1Y(), ((Cubic) CollectionsKt.first((List) corners.get((i9 + 1) % n2))).getAnchor0X(), ((Cubic) CollectionsKt.first((List) corners.get((i9 + 1) % n2))).getAnchor0Y()))));
            i9++;
            cutAdjusts = cutAdjusts;
            n = n2;
        }
        if (centerX == Float.MIN_VALUE) {
            jCalculateCenter = calculateCenter(vertices);
        } else if (centerY == Float.MIN_VALUE) {
            jCalculateCenter = calculateCenter(vertices);
        } else {
            jCalculateCenter = FloatFloatPair.m10constructorimpl(centerX, centerY);
        }
        int bits$iv$iv = (int) (jCalculateCenter >> 32);
        float cx = Float.intBitsToFloat(bits$iv$iv);
        int bits$iv$iv2 = (int) (jCalculateCenter & 4294967295L);
        float cy = Float.intBitsToFloat(bits$iv$iv2);
        return new RoundedPolygon(tempFeatures, cx, cy);
    }

    private static final long calculateCenter(float[] vertices) {
        float cumulativeX = 0.0f;
        float cumulativeY = 0.0f;
        int index = 0;
        while (index < vertices.length) {
            int index2 = index + 1;
            cumulativeX += vertices[index];
            index = index2 + 1;
            cumulativeY += vertices[index2];
        }
        float f = 2;
        return FloatFloatPair.m10constructorimpl((cumulativeX / vertices.length) / f, (cumulativeY / vertices.length) / f);
    }

    private static final float[] verticesFromNumVerts(int numVertices, float radius, float centerX, float centerY) {
        float[] result = new float[numVertices * 2];
        int arrayIndex = 0;
        int i = 0;
        while (i < numVertices) {
            float radius2 = radius;
            long vertex = PointKt.m103plusybeJwSQ(Utils.m119radialToCartesianL6JJ3z0$default(radius2, (Utils.getFloatPi() / numVertices) * 2 * i, 0L, 4, null), FloatFloatPair.m10constructorimpl(centerX, centerY));
            int arrayIndex2 = arrayIndex + 1;
            result[arrayIndex] = PointKt.m99getXDnnuFBc(vertex);
            arrayIndex = arrayIndex2 + 1;
            result[arrayIndex2] = PointKt.m100getYDnnuFBc(vertex);
            i++;
            radius = radius2;
        }
        return result;
    }
}
